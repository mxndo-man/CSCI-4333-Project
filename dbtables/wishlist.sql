CREATE TABLE wishlist(
    wishListId AUTOINCREMENT PRIMARY KEY,
    userId LONG,
    wathcId LONG,

    FOREIGN KEY (userId) REFERENCES tblUser (userId),
    FOREIGN KEY (watchId) REFERENCES watchType (watchId),

);