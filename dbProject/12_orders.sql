CREATE TABLE orders (
    orderId       INT AUTO_INCREMENT PRIMARY KEY,
    userId        INT NOT NULL,
    confirmNum    BIGINT NOT NULL UNIQUE,
    confirmEmail  VARCHAR(255) NOT NULL,
    -- address copied from the user at checkout, so later profile edits don't change old orders
    shipStreet    VARCHAR(255) NOT NULL,
    shipCity      VARCHAR(100) NOT NULL,
    shipProvince  VARCHAR(100),
    shipZip       VARCHAR(10),
    shipCountry   VARCHAR(100) NOT NULL,
    createdAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES users(userId)
) ENGINE=InnoDB;