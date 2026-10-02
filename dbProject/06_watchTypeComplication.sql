CREATE TABLE watchTypeComplication (
    watchId         INT NOT NULL,
    complicationId  INT NOT NULL,
    PRIMARY KEY (watchId, complicationId),
    FOREIGN KEY (watchId)        REFERENCES watchType(watchId),
    FOREIGN KEY (complicationId) REFERENCES complication(complicationId)
) ENGINE=InnoDB;
