CREATE TABLE wishlistItem (
    userId     INT NOT NULL,
    listingId  INT NOT NULL,
    PRIMARY KEY (userId, listingId),       -- removing = delete the row
    FOREIGN KEY (userId)    REFERENCES users(userId),
    FOREIGN KEY (listingId) REFERENCES listing(listingId)
) ENGINE=InnoDB;
