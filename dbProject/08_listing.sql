CREATE TABLE listing (
    listingId     INT AUTO_INCREMENT PRIMARY KEY,
    inventoryId   INT NOT NULL, -- This contains seller of watchInventory.userID
    askingPrice   DECIMAL(10,2) NOT NULL,
    status        ENUM('active','sold','removed') NOT NULL DEFAULT 'active',
    listedAt      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (inventoryId) REFERENCES watchInventory(inventoryId)
) ENGINE=InnoDB;
