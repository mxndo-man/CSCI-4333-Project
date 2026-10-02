CREATE TABLE wishlist(
    wishListId PRIMARY KEY, -- once need to be done once 
    userId LONG,
    watchId LONG,
    posOfWatch int, -- the place where the watch id is coming from


    -- they can remove it from their wishlist if it never reaches the car

    FOREIGN KEY (userId) REFERENCES tblUser (userId),
    FOREIGN KEY (watchId) REFERENCES watchType (watchId),

);