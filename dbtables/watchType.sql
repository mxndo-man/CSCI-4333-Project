CREATE TABLE watchType(
    watchId AUTOINCREMENT PRIMARY KEY, 

    model TEXT,
    yearOfProd int, -- year it was made
    price int,

    condition VARCHAR(255),
    --serialNum LONG, for final ref
    bandWidth int, -- mm 

    moveType VARCHAR(255), 
    complication VARCHAR(50), 

    classification VARCHAR(50), -- dive, dress ,sport
    
    -- make a refreence that they belong from moveType class
    FOREIGN KEY (moveType, complication) REFERENCES moveType
);