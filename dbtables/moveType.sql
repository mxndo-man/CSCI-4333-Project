CREATE TABLE moveType(
    moveType VARCHAR(255), -- ex: quartz, mech
    complication VARCHAR(255), --functions they have

    -- this also needs to be refreneced from Watch 
    PRIMARY KEY (moveType, complication)
);