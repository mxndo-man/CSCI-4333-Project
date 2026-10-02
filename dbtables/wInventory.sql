CREATE TABLE watchInventory(
    watchInventoryID AUTOINCREMENT PRIMARY KEY,
    userId LONG,
    watchID LONG,
    totalSum INT,
    


    FOREIGN KEY  userID REFERENCES tblUser(userId),
    FOREIGN KEY  watchID REFERENCES watchType(watchID),
    




);