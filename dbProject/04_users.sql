CREATE TABLE users (
    userId        INT AUTO_INCREMENT PRIMARY KEY,
    displayName   VARCHAR(25)  NOT NULL,
    userPassword  VARCHAR(255) NOT NULL,   -- hashed, so 255
    
    email         VARCHAR(255) NOT NULL UNIQUE,
    bankId        BIGINT,

    street        VARCHAR(255),
    city          VARCHAR(100),
    province      VARCHAR(100),
    zip           VARCHAR(10),             -- VARCHAR keeps leading zeros / letters
    country       VARCHAR(100)
) ENGINE=InnoDB;
