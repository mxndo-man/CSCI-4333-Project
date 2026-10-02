CREATE TABLE tblUser(
    userId AUTOINCREMENT PRIMARY KEY,
    UserPassword VARCHAR(50) 
    bankId LONG,
    Email VARCHAR(50), 
    -- removed cart id and wishlist id, since they both link back to userId 


    catalogId LONG, -- we shoudl change long to int maybe 
);