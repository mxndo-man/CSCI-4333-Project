-- =====================================================
-- Watch Marketplace Database (MySQL 8 / InnoDB)
-- Tables are ordered so every foreign key points at a
-- table that already exists.
-- =====================================================

DROP DATABASE IF EXISTS watch_marketplace;
CREATE DATABASE watch_marketplace;
USE watch_marketplace;

-- -----------------------------------------------------
-- Lookup tables
-- -----------------------------------------------------
CREATE TABLE brand (
    brandId      INT AUTO_INCREMENT PRIMARY KEY,
    brandName    VARCHAR(100) NOT NULL UNIQUE,
    country      VARCHAR(100),
    foundedYear  SMALLINT
) ENGINE=InnoDB;

CREATE TABLE movement (
    movementId   INT AUTO_INCREMENT PRIMARY KEY,
    moveType     VARCHAR(50) NOT NULL,   -- e.g. quartz, automatic, manual
    moveSubType  VARCHAR(100),           -- e.g. solar, chronometer-certified
    UNIQUE (moveType, moveSubType)
) ENGINE=InnoDB;

CREATE TABLE complication (
    complicationId INT AUTO_INCREMENT PRIMARY KEY,
    complicationName VARCHAR(50) NOT NULL UNIQUE  -- date, chronograph, GMT...
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Users (merged tblUser + userInfo, they were 1:1)
-- -----------------------------------------------------
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

-- -----------------------------------------------------
-- Watch models (the "kind" of watch)
-- exteriorID columns folded in here
-- -----------------------------------------------------
CREATE TABLE watchType (
    watchId         INT AUTO_INCREMENT PRIMARY KEY,
    brandId         INT NOT NULL,
    model           VARCHAR(100) NOT NULL,
    movementId      INT NOT NULL,
    classification  VARCHAR(50),           -- dive, dress, sport
    bandWidth       INT,                   -- mm
    caseSize        DECIMAL(4,1),          -- mm
    caseMaterial    VARCHAR(50),
    bandMaterial    VARCHAR(50),
    dialColour      VARCHAR(50),

    FOREIGN KEY (brandId)    REFERENCES brand(brandId),
    FOREIGN KEY (movementId) REFERENCES movement(movementId)
) ENGINE=InnoDB;

-- Many-to-many: a model can have several complications
CREATE TABLE watchTypeComplication (
    watchId         INT NOT NULL,
    complicationId  INT NOT NULL,
    PRIMARY KEY (watchId, complicationId),
    FOREIGN KEY (watchId)        REFERENCES watchType(watchId),
    FOREIGN KEY (complicationId) REFERENCES complication(complicationId)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Individual physical watches owned by users
-- (year, condition, serial live here, not on the model)
-- -----------------------------------------------------
CREATE TABLE watchInventory (
    inventoryId     INT AUTO_INCREMENT PRIMARY KEY,
    userId          INT NOT NULL,          -- current owner
    watchId         INT NOT NULL,          -- which model
    yearOfProd      SMALLINT,
    watchCondition  VARCHAR(50),           -- "condition" is reserved in MySQL
    serialNum       VARCHAR(50) UNIQUE,

    FOREIGN KEY (userId)  REFERENCES users(userId),
    FOREIGN KEY (watchId) REFERENCES watchType(watchId)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Listings (replaces catalogue / listing)
-- -----------------------------------------------------
CREATE TABLE listing (
    listingId     INT AUTO_INCREMENT PRIMARY KEY,
    sellerId      INT NOT NULL,
    inventoryId   INT NOT NULL,
    askingPrice   DECIMAL(10,2) NOT NULL,
    status        ENUM('active','sold','removed') NOT NULL DEFAULT 'active',
    listedAt      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (sellerId)    REFERENCES users(userId),
    FOREIGN KEY (inventoryId) REFERENCES watchInventory(inventoryId)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Wishlist: one row per saved listing
-- -----------------------------------------------------
CREATE TABLE wishlistItem (
    userId     INT NOT NULL,
    UNIQUE(listingId)  INT NOT NULL,
    addedAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (userId, listingId),       -- removing = delete the row
    FOREIGN KEY (userId)    REFERENCES users(userId),
    FOREIGN KEY (listingId) REFERENCES listing(listingId)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Cart (one per user) and its items
-- -----------------------------------------------------
CREATE TABLE cart (
    cartId  INT AUTO_INCREMENT PRIMARY KEY,
    userId  INT NOT NULL UNIQUE,
    FOREIGN KEY (userId) REFERENCES users(userId)
) ENGINE=InnoDB;

CREATE TABLE cartItem (
    cartId     INT NOT NULL,
    listingId  INT NOT NULL,
    PRIMARY KEY (cartId, listingId),
    FOREIGN KEY (cartId)    REFERENCES cart(cartId),
    FOREIGN KEY (listingId) REFERENCES listing(listingId)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Orders (confirmNum / confirmEmail moved here from cart)
-- -----------------------------------------------------
CREATE TABLE orders (
    orderId       INT AUTO_INCREMENT PRIMARY KEY,
    userId        INT NOT NULL,
    confirmNum    BIGINT NOT NULL UNIQUE,
    confirmEmail  VARCHAR(255) NOT NULL,
    createdAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES users(userId)
) ENGINE=InnoDB;

CREATE TABLE orderItem (
    orderId    INT NOT NULL,
    listingId  INT NOT NULL,
    salePrice  DECIMAL(10,2) NOT NULL,     -- price at time of sale
    PRIMARY KEY (orderId, listingId),
    FOREIGN KEY (orderId)   REFERENCES orders(orderId),
    FOREIGN KEY (listingId) REFERENCES listing(listingId)
) ENGINE=InnoDB;