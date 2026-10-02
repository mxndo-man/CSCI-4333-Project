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
