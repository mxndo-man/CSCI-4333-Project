CREATE TABLE tblUser(
    userId LONG,
    watchInventoryID LONG,


    -- removed cart id and wishlist id, since they both link back to userId 
    FOREIGN KEY (userID) REFERENCES userInfo(userId),
    FOREIGN KEY (watchInventoryID) REFERENCES watchInventory(watchInventoryID),
);