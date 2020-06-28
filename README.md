# airplane_tickets_database
A simple PLSQL database for managing airplane ticket reservations (created for learning purposes).

Author: Yaroslava Tkachuk, BSc student of the University of Silesia, Katowice, Poland.

Database type: Oracle Database 12c

Here You can see a diagram, demonstrating the database structure:
![Alt text](./airplane_tickets_db_diagram.png?raw=true "Airpline Tickets Database Diagram")

Files:
airplane_tickets_db.ddl - main database file
airplane_tickets_db_diagram.png - database diagram
airplane_tickets_db_examples.ddl - some examples to feed into database for testing
airplane_tickets_db_test.ddl - few weird complicated queries to show how fancy the database is: of course, normally databases are constructed in a way that there is no need to use such long, slow, and generally non-optimal queries - again learning purposes :)

Software used:
- Oracle SQL Developer 19.2.1.247
- Oracle SQL Developer Data Modeller

Some of the main database functionalities:
- taking care of proper insertion, deletion, and update operations
- ticket classes restrict the luggage size / weight (when luggage is being added or modified)
- restricts using a plane already serving a flight for another flight until it's busy
- restricts maximum number of tickets sold per flight (depends on the plane capacity)

Warning: another non-optimal thing is the cascade records deletion: it does  contribute to the database structure integrity, but kills plenty of data as well :(

If You want to have some fun, You can play around with the example and testing files, and maybe try to use Your own evil ideas to crash the database (hopefully it won't happen). Enjoy!
