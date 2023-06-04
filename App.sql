CREATE TABLE accounts (
    user_id       INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name    VARCHAR(20) DEFAULT NULL,
    last_name     VARCHAR(20) DEFAULT NULL,
    password      VARCHAR(50) NOT NULL,
    mobile_number VARCHAR(15) DEFAULT NULL,
    email         VARCHAR(50) NOT NULL,
    occupation	VARCHAR(10) NOT NULL);

CREATE TABLE admins (
    salary           DOUBLE DEFAULT NULL,
    branch           VARCHAR(100) DEFAULT NULL,
    accounts_user_id INTEGER NOT NULL);

ALTER TABLE admins ADD CONSTRAINT admins_pk PRIMARY KEY ( accounts_user_id );

CREATE TABLE cards (
    card_number              VARCHAR(100) NOT NULL,
    security_number          VARCHAR(5) NOT NULL,
    expiry_date              DATE NOT NULL,
    clients_accounts_user_id INTEGER NOT NULL);

ALTER TABLE cards ADD CONSTRAINT cards_pk PRIMARY KEY ( card_number );

CREATE TABLE cars (
    license_plate            VARCHAR(50) NOT NULL,
    service_type             VARCHAR(30) NOT NULL,
    car_model                VARCHAR(50) NOT NULL,
    color                    VARCHAR(50) NOT NULL,
    drivers_accounts_user_id INTEGER NOT NULL);

ALTER TABLE cars ADD CONSTRAINT cars_pk PRIMARY KEY ( license_plate );

CREATE TABLE clients (
    client_rating    INTEGER DEFAULT 10,
    accounts_user_id INTEGER NOT NULL);

ALTER TABLE clients ADD CONSTRAINT clients_pk PRIMARY KEY ( accounts_user_id );

CREATE TABLE drivers (
    drivers_rating     DOUBLE DEFAULT 10,
    drivers_license    VARCHAR(50) DEFAULT NULL,
    total_rides        INTEGER DEFAULT 0,
    accounts_user_id   INTEGER NOT NULL,
    cars_license_plate VARCHAR(50) DEFAULT NULL);

ALTER TABLE drivers ADD CONSTRAINT drivers_pk PRIMARY KEY ( accounts_user_id );

CREATE TABLE promocodes (
    code                    VARCHAR(50) NOT NULL,
    starts_at               DATE NOT NULL,
    expires_at              DATE NOT NULL,
    uses                    INTEGER DEFAULT 0,
    max_uses                INTEGER DEFAULT NULL,
    discount_amount         DOUBLE NOT NULL,
    admins_accounts_user_id INTEGER NOT NULL);

ALTER TABLE promocodes ADD CONSTRAINT promocodes_pk PRIMARY KEY ( code );

CREATE TABLE trips (
    trip_id                  INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pickup_location          VARCHAR(100) NOT NULL,
    payment_method           VARCHAR(50) NOT NULL,
    dropoff_location         VARCHAR(100) NOT NULL,
    drivers_accounts_user_id INTEGER NOT NULL,
    clients_accounts_user_id INTEGER NOT NULL);

ALTER TABLE admins
    ADD CONSTRAINT admins_accounts_fk FOREIGN KEY ( accounts_user_id )
        REFERENCES accounts ( user_id )
            ON DELETE CASCADE;

ALTER TABLE cards
    ADD CONSTRAINT cards_clients_fk FOREIGN KEY ( clients_accounts_user_id )
        REFERENCES clients ( accounts_user_id )
            ON DELETE CASCADE;

ALTER TABLE cars
    ADD CONSTRAINT cars_drivers_fk FOREIGN KEY ( drivers_accounts_user_id )
        REFERENCES drivers ( accounts_user_id )
            ON DELETE CASCADE;

ALTER TABLE clients
    ADD CONSTRAINT clients_accounts_fk FOREIGN KEY ( accounts_user_id )
        REFERENCES accounts ( user_id )
            ON DELETE CASCADE;

ALTER TABLE drivers
    ADD CONSTRAINT drivers_accounts_fk FOREIGN KEY ( accounts_user_id )
        REFERENCES accounts ( user_id )
            ON DELETE CASCADE;

ALTER TABLE drivers
    ADD CONSTRAINT drivers_cars_fk FOREIGN KEY ( cars_license_plate )
        REFERENCES cars ( license_plate )
            ON DELETE CASCADE;

ALTER TABLE promocodes
    ADD CONSTRAINT promocodes_admins_fk FOREIGN KEY ( admins_accounts_user_id )
        REFERENCES admins ( accounts_user_id )
            ON DELETE CASCADE;

ALTER TABLE trips
    ADD CONSTRAINT trips_clients_fk FOREIGN KEY ( clients_accounts_user_id )
        REFERENCES clients ( accounts_user_id )
            ON DELETE CASCADE;

ALTER TABLE trips
    ADD CONSTRAINT trips_drivers_fk FOREIGN KEY ( drivers_accounts_user_id )
        REFERENCES drivers ( accounts_user_id )
            ON DELETE CASCADE;
