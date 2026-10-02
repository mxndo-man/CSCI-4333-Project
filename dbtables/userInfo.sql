CREATE TABLE userInfo (
    userID AUTOINCREMENT PRIMARY KEY,
    displayName VARCHAR(25),
    userPassword VARCHAR(255), -- has to be 255 since password is hashed
    bankId LONG,
    Email VARCHAR(255), 
    street TEXT,
    city TEXT,
    province TEXT,
    ZIP int, 
    country TEXT,
);