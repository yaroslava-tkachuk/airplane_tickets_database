--Skrypt do tworzenia bazy danych AIRPLANE TICKETS 

-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2020-01-04 18:28:10 CET
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c

--Creating tables and adding primary keys

CREATE TABLE extra_bonus_services (
    service_name    VARCHAR2(20) NOT NULL,
    bonus_points   NUMBER(3) NOT NULL
);

ALTER TABLE extra_bonus_services ADD CONSTRAINT extra_services_pk PRIMARY KEY ( service_name );

CREATE TABLE flights (
    flight_number         VARCHAR2(7) NOT NULL,
    origin_airport        VARCHAR2(3) NOT NULL,
    destination_airport   VARCHAR2(3) NOT NULL,
    departure             DATE NOT NULL,
    arrival               DATE NOT NULL,
    price                 NUMBER(7, 2) NOT NULL,
    plane_reg_number      NUMBER(10) NOT NULL
);

ALTER TABLE flights ADD CONSTRAINT flights_pk PRIMARY KEY ( flight_number );

CREATE TABLE luggage (
    luggage_id      VARCHAR2(10) NOT NULL,
    height          NUMBER(6, 2) NOT NULL,
    width           NUMBER(6, 2) NOT NULL,
    lg_length       NUMBER(6, 2) NOT NULL,
    weight          NUMBER(5, 2) NOT NULL,
    class_name      VARCHAR2(10) NOT NULL,
    ticket_number   VARCHAR2(13) NOT NULL
);

ALTER TABLE luggage ADD CONSTRAINT luggage_pk PRIMARY KEY ( luggage_id );

CREATE TABLE luggage_class (
    class_name     VARCHAR2(10) NOT NULL,
    max_height     NUMBER(6, 2) NOT NULL,
    max_width      NUMBER(6, 2) NOT NULL,
    max_lg_length  NUMBER(6, 2) NOT NULL,
    max_weight     NUMBER(5, 2) NOT NULL,
    price          NUMBER(6, 2) NOT NULL
);

ALTER TABLE luggage_class ADD CONSTRAINT luggage_class_pk PRIMARY KEY ( class_name );

CREATE TABLE passengers (
    passport_number       VARCHAR2(9) NOT NULL,
    pass_name             VARCHAR2(20) NOT NULL,
    surname               VARCHAR2(20) NOT NULL,
    birth_date            DATE NOT NULL,
    passport_issue        DATE NOT NULL,
    passport_expiration   DATE NOT NULL,
    country_code          VARCHAR2(15) NOT NULL
);

ALTER TABLE passengers ADD CONSTRAINT passengers_pk PRIMARY KEY ( passport_number );

CREATE TABLE plane_manufacturer (
    plane_man_name   VARCHAR2(10) NOT NULL,
    phone            NUMBER(15),
    email            VARCHAR2(320)
);

ALTER TABLE plane_manufacturer ADD CONSTRAINT plane_manufacturer_pk PRIMARY KEY ( plane_man_name );

CREATE TABLE planes (
    plane_reg_number   NUMBER(10) NOT NULL,
    plane_model        VARCHAR2(10),
    max_pass_number    NUMBER(4) NOT NULL,
    plane_man_name     VARCHAR2(10) NOT NULL
);

ALTER TABLE planes ADD CONSTRAINT planes_pk PRIMARY KEY ( plane_reg_number );

CREATE TABLE ticket_class (
    class_name         VARCHAR2(10) NOT NULL,
    price_percentage   NUMBER(3) NOT NULL
);

ALTER TABLE ticket_class ADD CONSTRAINT ticket_class_pk PRIMARY KEY ( class_name );

CREATE TABLE tickets (
    ticket_number     VARCHAR2(13) NOT NULL,
    flight_number     VARCHAR2(7) NOT NULL,
    class_name        VARCHAR2(10) NOT NULL,
    passport_number   VARCHAR2(9) NOT NULL,
    service_name      VARCHAR2(20)
);

ALTER TABLE tickets ADD CONSTRAINT tickets_pk PRIMARY KEY ( ticket_number );

--Adding foreign keys

ALTER TABLE tickets
    ADD CONSTRAINT flight_number_fk FOREIGN KEY ( flight_number )
        REFERENCES flights ( flight_number )
            ON DELETE CASCADE;

ALTER TABLE tickets
    ADD CONSTRAINT extra_service_fkv2 FOREIGN KEY ( service_name )
        REFERENCES extra_bonus_services ( service_name );

ALTER TABLE luggage
    ADD CONSTRAINT luggage_class_fk FOREIGN KEY ( class_name )
        REFERENCES luggage_class ( class_name )
            ON DELETE CASCADE;

ALTER TABLE tickets
    ADD CONSTRAINT passport_number_fk FOREIGN KEY ( passport_number )
        REFERENCES passengers ( passport_number )
            ON DELETE CASCADE;

ALTER TABLE planes
    ADD CONSTRAINT plane_man_name_fk FOREIGN KEY ( plane_man_name )
        REFERENCES plane_manufacturer ( plane_man_name )
            ON DELETE CASCADE;

ALTER TABLE flights
    ADD CONSTRAINT plane_reg_number_fk FOREIGN KEY ( plane_reg_number )
        REFERENCES planes ( plane_reg_number )
            ON DELETE CASCADE;

ALTER TABLE tickets
    ADD CONSTRAINT ticket_class_fk FOREIGN KEY ( class_name )
        REFERENCES ticket_class ( class_name )
            ON DELETE CASCADE;

ALTER TABLE luggage
    ADD CONSTRAINT ticket_number_fk FOREIGN KEY ( ticket_number )
        REFERENCES tickets ( ticket_number )
            ON DELETE CASCADE;

--Adding constraints on tables' fieds

ALTER TABLE plane_manufacturer
    ADD CONSTRAINT check_phone CHECK (phone > 0);

ALTER TABLE planes
    ADD CONSTRAINT check_plane_reg_number CHECK (plane_reg_number > 0);
    
ALTER TABLE planes
    ADD CONSTRAINT check_max_pass_number CHECK (max_pass_number > 0);
    
ALTER TABLE flights
    ADD CONSTRAINT check_airports CHECK (origin_airport != destination_airport);
    
ALTER TABLE flights
    ADD CONSTRAINT check_datetime CHECK (departure < arrival);
    
ALTER TABLE flights
    ADD CONSTRAINT check_price CHECK (price > 0);
    
ALTER TABLE passengers
    ADD CONSTRAINT check_birth_date CHECK (birth_date < passport_issue);
    
ALTER TABLE passengers
    ADD CONSTRAINT check_passport_issue_date CHECK (passport_issue < passport_expiration);
    
ALTER TABLE ticket_class
    ADD CONSTRAINT check_price_percentage CHECK ((price_percentage >= 1) and (price_percentage <= 100));
    
ALTER TABLE luggage
    ADD CONSTRAINT check_height CHECK (height > 0);

ALTER TABLE luggage
    ADD CONSTRAINT check_width CHECK (width > 0);
    
ALTER TABLE luggage
    ADD CONSTRAINT check_lg_length CHECK (lg_length > 0);
    
ALTER TABLE luggage
    ADD CONSTRAINT check_weight CHECK (weight > 0);
    
ALTER TABLE luggage
    ADD CONSTRAINT check_max_weight CHECK (max_weight > 0);
    
ALTER TABLE luggage_class
    ADD CONSTRAINT check_max_height CHECK (max_height > 0);

ALTER TABLE luggage_class
    ADD CONSTRAINT check_max_width CHECK (max_width > 0);
    
ALTER TABLE luggage_class
    ADD CONSTRAINT check_max_lg_length CHECK (max_lg_length > 0);
    
ALTER TABLE luggage_class
    ADD CONSTRAINT check_max_weight CHECK (max_weight > 0);
    
ALTER TABLE luggage_class
    ADD CONSTRAINT check_lg_price CHECK (price > 0);
    
ALTER TABLE extra_bonus_services
    ADD CONSTRAINT check_bonus_points CHECK (bonus_points > 0);
    
--Creating triggers

CREATE OR REPLACE TRIGGER height_less_than_max
    BEFORE INSERT OR UPDATE ON luggage 
    FOR EACH ROW
    DECLARE
    luggage_max_height NUMBER;
    BEGIN
        SELECT max_height INTO luggage_max_height FROM luggage_class WHERE :NEW.class_name = luggage_class.class_name;
        IF (:NEW.height > luggage_max_height)
            THEN RAISE_APPLICATION_ERROR(-20021, 'Luggage height exceeds maximum height for the class chosen.');
        END IF;
    END;
    
CREATE OR REPLACE TRIGGER width_less_than_max
    BEFORE INSERT OR UPDATE ON luggage 
    FOR EACH ROW
    DECLARE
    luggage_max_width NUMBER;
    BEGIN
        SELECT max_width INTO luggage_max_width FROM luggage_class WHERE :NEW.class_name = luggage_class.class_name;
        IF (:NEW.width > luggage_max_width)
            THEN RAISE_APPLICATION_ERROR(-20021, 'Luggage width exceeds maximum width for the class chosen.');
        END IF;
    END;
    
CREATE OR REPLACE TRIGGER lg_length_less_than_max
    BEFORE INSERT OR UPDATE ON luggage 
    FOR EACH ROW
    DECLARE
    luggage_max_length NUMBER;
    BEGIN
        SELECT max_lg_length INTO luggage_max_length FROM luggage_class WHERE :NEW.class_name = luggage_class.class_name;
        IF (:NEW.lg_length > luggage_max_length)
            THEN RAISE_APPLICATION_ERROR(-20021, 'Luggage length exceeds maximum length for the class chosen.');
        END IF;
    END;

CREATE OR REPLACE TRIGGER weight_less_than_max
    BEFORE INSERT OR UPDATE ON luggage 
    FOR EACH ROW
    DECLARE
    luggage_max_weight NUMBER;
    BEGIN
        SELECT max_weight INTO luggage_max_weight FROM luggage_class WHERE :NEW.class_name = luggage_class.class_name;
        IF (:NEW.weight > luggage_max_weight)
            THEN RAISE_APPLICATION_ERROR(-20021, 'Luggage weight exceeds maximum weight for the class chosen.');
        END IF;
    END;
    
CREATE OR REPLACE TRIGGER birth_date_before_departure
    BEFORE INSERT OR UPDATE ON tickets
    FOR EACH ROW
    DECLARE
    pass_birth_date DATE;
    departure_date DATE;
    BEGIN
        SELECT birth_date INTO pass_birth_date 
        FROM passengers
        WHERE passengers.passport_number = :NEW.passport_number;

        SELECT departure INTO departure_date 
        FROM flights
        WHERE flights.flight_number = :NEW.flight_number;
        
        IF (pass_birth_date >= departure_date)
            THEN RAISE_APPLICATION_ERROR(-20021, 'Passenger"s birth date should be earlier than departure date.');
        END IF;
    END;
    
CREATE OR REPLACE TRIGGER passp_issue_before_departure
    BEFORE INSERT OR UPDATE ON tickets
    FOR EACH ROW
    DECLARE
    passp_issue_date DATE;
    departure_date DATE;
    BEGIN
        SELECT passport_issue INTO passp_issue_date 
        FROM passengers
        WHERE passengers.passport_number = :NEW.passport_number;

        SELECT departure INTO departure_date 
        FROM flights
        WHERE flights.flight_number = :NEW.flight_number;
        
        IF (passp_issue_date >= departure_date)
            THEN RAISE_APPLICATION_ERROR(-20021, 'Passenger"s passport issue date should be earlier than departure date.');
        END IF;
    END;
    
CREATE OR REPLACE TRIGGER passp_expiration_after_arrival
    BEFORE INSERT OR UPDATE ON tickets
    FOR EACH ROW
    DECLARE
    passp_expiration_date DATE;
    arrival_date DATE;
    BEGIN
        SELECT passport_expiration INTO passp_expiration_date 
        FROM passengers
        WHERE passengers.passport_number = :NEW.passport_number;

        SELECT arrival INTO arrival_date 
        FROM flights
        WHERE flights.flight_number = :NEW.flight_number;
        
        IF (passp_expiration_date <= arrival_date)
            THEN RAISE_APPLICATION_ERROR(-20021, 'Passenger"s passport expiration date should be later than arrival date.');
        END IF;
    END;
    
--Functions and procedures
--Checking if plane is available
CREATE OR REPLACE FUNCTION count_same_date_flights(fl_number IN VARCHAR, pl_reg_number IN NUMBER, dep IN DATE, arr IN DATE)
    RETURN NUMBER IS same_date_flights NUMBER;
    BEGIN
    SELECT COUNT(flight_number) INTO same_date_flights
                FROM flights WHERE 
                ((dep BETWEEN flights.departure AND flights.arrival)
                OR (arr BETWEEN flights.departure AND flights.arrival))
                AND pl_reg_number = flights.plane_reg_number AND fl_number != flights.flight_number;
    RETURN same_date_flights;
    END;
    

CREATE OR REPLACE PROCEDURE insert_flight(
	   f_number IN flights.flight_number%TYPE,
	   f_origin_airport IN flights.origin_airport%TYPE,
	   f_destination_airport IN flights.destination_airport%TYPE,
	   f_departure IN flights.departure%TYPE,
       f_arrival IN flights.arrival%TYPE,
       f_price IN flights.price%TYPE,
       f_plane_reg_number IN flights.plane_reg_number%TYPE)
       
IS
BEGIN
    IF
    count_same_date_flights(f_number, f_plane_reg_number, f_departure, f_arrival) > 0
    THEN RAISE_APPLICATION_ERROR(-20021, 'Plane is not available for the flight.');
    ELSE
        INSERT INTO flights 
        (flight_number, origin_airport, destination_airport, 
        departure, arrival, price, plane_reg_number) 
        VALUES 
        (f_number, f_origin_airport, f_destination_airport, 
        f_departure, f_arrival, f_price, f_plane_reg_number);
        COMMIT;
    END IF;
END;

CREATE OR REPLACE PROCEDURE update_flight(
	   f_number IN flights.flight_number%TYPE,
	   f_origin_airport IN flights.origin_airport%TYPE,
	   f_destination_airport IN flights.destination_airport%TYPE,
	   f_departure IN flights.departure%TYPE,
       f_arrival IN flights.arrival%TYPE,
       f_price IN flights.price%TYPE,
       f_plane_reg_number IN flights.plane_reg_number%TYPE)
       
IS
BEGIN
    IF
    count_same_date_flights(f_number, f_plane_reg_number, f_departure, f_arrival) > 0
    THEN RAISE_APPLICATION_ERROR(-20021, 'Plane is not available for the flight.');
    ELSE
        DELETE FROM flights WHERE flights.flight_number = f_number;
        COMMIT;
        
        INSERT INTO flights 
        (flight_number, origin_airport, destination_airport, 
        departure, arrival, price, plane_reg_number) 
        VALUES 
        (f_number, f_origin_airport, f_destination_airport, 
        f_departure, f_arrival, f_price, f_plane_reg_number);
        COMMIT;
    END IF;
END;

--Checking if there are seats available in the plane
CREATE OR REPLACE FUNCTION count_tickets(tk_flight_number IN VARCHAR, tk_number IN VARCHAR)
    RETURN
    NUMBER IS curr_tickets_numb NUMBER;
    BEGIN
    SELECT COUNT(ticket_number) INTO curr_tickets_numb
                FROM tickets WHERE 
                tickets.flight_number = tk_flight_number
                AND tickets.ticket_number != tk_number;
    RETURN curr_tickets_numb;
    END;
    
CREATE OR REPLACE FUNCTION get_max_tickets_number(tk_flight_number IN VARCHAR)
    RETURN
    NUMBER IS max_tickets_numb NUMBER;
    BEGIN
    SELECT max_pass_number INTO max_tickets_numb
        FROM planes INNER JOIN flights
        ON planes.plane_reg_number = flights.plane_reg_number
        WHERE flights.flight_number = tk_flight_number;
    RETURN max_tickets_numb;
    END;
    

CREATE OR REPLACE PROCEDURE insert_ticket(
       tk_number IN tickets.ticket_number%TYPE,
	   tk_flight_number IN tickets.flight_number%TYPE,
	   tk_class_name IN tickets.class_name%TYPE,
	   tk_passport_number IN tickets.passport_number%TYPE,
	   tk_service_name IN tickets.service_name%TYPE)
       
IS
BEGIN
    IF
    (count_tickets(tk_flight_number, tk_number) + 1) > get_max_tickets_number(tk_flight_number)
    THEN RAISE_APPLICATION_ERROR(-20021, 'Plane for the flight chosen is full.');
    ELSE
        INSERT INTO tickets 
        (ticket_number, flight_number, class_name, passport_number, service_name) 
        VALUES 
        (tk_number, tk_flight_number, tk_class_name, tk_passport_number, tk_service_name);
        COMMIT;
    END IF;
END;

CREATE OR REPLACE PROCEDURE update_ticket(
	   tk_number IN tickets.ticket_number%TYPE,
	   tk_flight_number IN tickets.flight_number%TYPE,
	   tk_class_name IN tickets.class_name%TYPE,
	   tk_passport_number IN tickets.passport_number%TYPE,
	   tk_service_name IN tickets.service_name%TYPE)
       
IS
BEGIN
    IF
    count_tickets(tk_flight_number, tk_number) + 1 > get_max_tickets_number(tk_flight_number)
    THEN RAISE_APPLICATION_ERROR(-20021, 'Plane for the flight chosen is full.');
    ELSE
        DELETE FROM tickets WHERE tickets.ticket_number = tk_number;
        COMMIT;
        
        INSERT INTO tickets 
        (ticket_number, flight_number, class_name, passport_number, service_name) 
        VALUES 
        (tk_number, tk_flight_number, tk_class_name, tk_passport_number, tk_service_name);
        COMMIT;
    END IF;
END;