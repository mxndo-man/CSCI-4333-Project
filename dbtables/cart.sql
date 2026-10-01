CREATE TABLE cart(
    cartId AUTOINCREMENT PRIMARY KEY,
    watchId LONG,
    userId LONG,

    FOREIGN KEY (watchId) REFERENCES watchType
    FOREIGN KEY (userId) REFERENCES tblUser







);