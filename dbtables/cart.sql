CREATE TABLE cart(
    cartId AUTOINCREMENT PRIMARY KEY,
    watchId LONG,
    userId LONG,
    -- user id is a primary key it holds email, bank-id and user id
    -- This can be said for watchType

    FOREIGN KEY (watchId) REFERENCES watchType
    FOREIGN KEY (userId) REFERENCES tblUser







);