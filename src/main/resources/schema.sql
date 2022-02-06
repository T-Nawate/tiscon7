CREATE TABLE IF NOT EXISTS PREFECTURE
(
    PREFECTURE_ID                   CHAR(2) NOT NULL,
    PREFECTURE_NAME                 VARCHAR(30) NOT NULL,
    PRIMARY KEY (PREFECTURE_ID)
);

CREATE TABLE IF NOT EXISTS CUSTOMER
(
    CUSTOMER_ID                     INT NOT NULL AUTO_INCREMENT,
    OLD_PREFECTURE_ID               CHAR(2) NOT NULL,
    NEW_PREFECTURE_ID               CHAR(2) NOT NULL,
    CUSTOMER_NAME                   VARCHAR(60) NOT NULL,
    TEL                             VARCHAR(11) NOT NULL,
    EMAIL                           VARCHAR(256) NOT NULL,
    OLD_ADDRESS                     VARCHAR(200) NOT NULL,
    NEW_ADDRESS                     VARCHAR(200) NOT NULL,
    MOVING_MONTH                    VARCHAR(2) NOT NULL,
    PRIMARY KEY (CUSTOMER_ID)
);

CREATE TABLE IF NOT EXISTS OPTIONAL_SERVICE
(
    SERVICE_ID                      INT NOT NULL,
    SERVICE_NAME                    VARCHAR(50) NOT NULL,
    PRICE                           INT NOT NULL,
    PRIMARY KEY (SERVICE_ID)
);

CREATE TABLE IF NOT EXISTS CUSTOMER_OPTION_SERVICE
(
    CUSTOMER_ID                     INT NOT NULL,
    SERVICE_ID                      INT NOT NULL,
    PRIMARY KEY (CUSTOMER_ID, SERVICE_ID),
    FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY(SERVICE_ID) REFERENCES OPTIONAL_SERVICE(SERVICE_ID)
);

CREATE TABLE IF NOT EXISTS PACKAGE_BOX
(
    PACKAGE_ID                      INT NOT NULL,
    BOX                             INT NOT NULL,
    PACKAGE_NAME                    VARCHAR(50) NOT NULL,
    PRIMARY KEY (PACKAGE_ID)
);

CREATE TABLE IF NOT EXISTS CUSTOMER_PACKAGE
(
    CUSTOMER_ID                     INT NOT NULL,
    PACKAGE_ID                      INT NOT NULL,
    PACKAGE_NUMBER                  INT,
    PRIMARY KEY (PACKAGE_ID, CUSTOMER_ID),
    FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY(PACKAGE_ID) REFERENCES PACKAGE_BOX(PACKAGE_ID)
);

CREATE TABLE IF NOT EXISTS TRUCK_CAPACITY
(
    TRUCK_ID                        INT NOT NULL,
    TRUCK_TYPE                      VARCHAR(50) NOT NULL,
    MAX_BOX                         INT NOT NULL,
    PRICE                           INT NOT NULL,
    PRIMARY KEY (TRUCK_ID)
);


CREATE TABLE IF NOT EXISTS PREFECTURE_DISTANCE
(
    PREFECTURE_ID_FROM              CHAR(2) NOT NULL,
    PREFECTURE_ID_TO                CHAR(2) NOT NULL,
    DISTANCE                        DOUBLE NOT NULL,
    PRIMARY KEY (PREFECTURE_ID_FROM, PREFECTURE_ID_TO),
    FOREIGN KEY (PREFECTURE_ID_FROM) REFERENCES PREFECTURE(PREFECTURE_ID),
    FOREIGN KEY (PREFECTURE_ID_TO) REFERENCES PREFECTURE(PREFECTURE_ID)
);


