CREATE TABLE cartItem (
    cartId     INT NOT NULL,
    listingId  INT NOT NULL,
    PRIMARY KEY (cartId, listingId),
    FOREIGN KEY (cartId)    REFERENCES cart(cartId),
    FOREIGN KEY (listingId) REFERENCES listing(listingId)
) ENGINE=InnoDB;
