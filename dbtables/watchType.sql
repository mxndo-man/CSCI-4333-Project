CREATE TABLE watchType(
    watchId AUTOINCREMENT PRIMARY KEY, 
    sizeOfBand int,
    material VARCHAR(50)
    moveTypeId LONG, -- a long int
    moveSubTypeId LONG, -- a long in {forieng keys from moveType}
    complication VARCHAR(50),
    classification VARCHAR(50),
    -- make a refreence that they belong from moveType class
    FOREIGN KEY (moveTypeID, moveSubTypeId) REFERENCES moveType
);