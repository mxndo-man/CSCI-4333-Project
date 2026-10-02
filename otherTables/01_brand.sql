CREATE TABLE brand (
    brandId      INT AUTO_INCREMENT PRIMARY KEY,
    brandName    VARCHAR(100) NOT NULL UNIQUE,
    country      VARCHAR(100),
) ENGINE=InnoDB;
