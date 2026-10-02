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
