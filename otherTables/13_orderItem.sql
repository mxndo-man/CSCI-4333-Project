CREATE TABLE orderItem (
    orderId    INT NOT NULL,
    listingId  INT NOT NULL,
    salePrice  DECIMAL(10,2) NOT NULL,     -- price at time of sale
    PRIMARY KEY (orderId, listingId),
    UNIQUE (listingId),                    -- a listing can only be sold once
    FOREIGN KEY (orderId)   REFERENCES orders(orderId),
    FOREIGN KEY (listingId) REFERENCES listing(listingId)
) ENGINE=InnoDB;