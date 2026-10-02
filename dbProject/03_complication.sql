CREATE TABLE complication (
    complicationId INT AUTO_INCREMENT PRIMARY KEY,
    complicationName VARCHAR(50) NOT NULL UNIQUE  -- date, chronograph, GMT...
) ENGINE=InnoDB;
