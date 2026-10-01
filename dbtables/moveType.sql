CREATE TABLE moveType(
    moveTypeId LONG, -- a long int
    moveSubTypeId LONG,
    -- this also needs to be refreneced from Watch 
    PRIMARY KEY (moveTypeId, moveSubTypeId)
);