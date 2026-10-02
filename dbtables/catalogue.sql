CREATE TABLE catalogue (
    watchID LONG, -- Foreign Key: The attributes of the watchID connected from watchType
    userID LONG, -- Foreign Key: The userID that is linked to the post
    watchInventoryID LONG, -- Foreign Key: Inorder to sell a watch the userID has to have the watch in their watchInventory -- Foreign Key: Inorder to sell a 
        --watch the userID has to have the watch in their watchInventory

    -- overright method of watchPrice
    watchPrice int, -- watchPrice: might be redudadent, watchPrice is connected from watchID
    askingPrice int, -- askingPrice: What the user wants for the price.
    catalogueId AUTOINCREMENT PRIMARY KEY,

    --actionButton -> this will either be the wishinglist, cart

    FOREIGN KEY (userID) REFERENCES tblUser(userID),
    FOREIGN KEY (watchInventoryID) REFERENCES watchInventory(watchInventoryID),
    FOREIGN KEY (watchID) REFERENCES watchType(watchID),
);