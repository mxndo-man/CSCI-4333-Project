
CREATE TABLE listings(
    -- Shows all the catalogue to the users 
    catalogueId LONG,
    -- Brand


    FOREIGN KEY (catalogueId) REFERENCES catalogue(catalogueId)
);