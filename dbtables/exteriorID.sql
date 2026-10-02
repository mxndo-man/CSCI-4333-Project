CREATE TABLE exteriorID(
    watchId AUTOINCREMENT PRIMARY KEY, -- Foreign Key: The WatchId that is connected to this exterior
    material TEXT, -- Material: exterior material 
    bandMaterial TEXT, -- bandMaterial: the band around the wrist
    dialColour TEXT, -- dialColour: 
    caseSize  FLOAT,


    FOREIGN KEY (watchID) REFERENCES watchType, 

);
