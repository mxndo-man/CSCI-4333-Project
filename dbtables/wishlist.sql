CREATE TABLE wishlist(
    wishListId AUTOINCREMENT PRIMARY KEY,
    userId LONG,
    wathcId,

    FOREIGN KEY (userId) REFERENCES tblUser (userId),
    FOREIGN KEY (watchId) REFERENCES watchType (watchId),

);