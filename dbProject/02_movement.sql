CREATE TABLE movement (
    movementId   INT AUTO_INCREMENT PRIMARY KEY,
    moveType     VARCHAR(50) NOT NULL,   -- e.g. quartz, automatic, manual
    moveSubType  VARCHAR(100),           -- e.g. solar, chronometer-certified
    UNIQUE (moveType, moveSubType)
) ENGINE=InnoDB;
