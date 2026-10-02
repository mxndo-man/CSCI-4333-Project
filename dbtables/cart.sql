CREATE TABLE cart(
    cartId AUTOINCREMENT PRIMARY KEY, -- Primary Key. The cartId connected to the userID.
    userId LONG, -- FOREIGN KEY userID: To see which userID is connected to the cart curr
        -- from it being connected to another table which is protected.
    confirmNum LONG, -- Attribute: Will send a confirmation number to the user at checkout
    confirmEmail TEXT, -- Attribute: Will send an email about the items.



    -- user id is a primary key it holds email, bank-id and user id
    -- This can be said for watchType
    -- SELECT watchID IN wishlist WHERE posOfWatch;  
        -- once it has been selected just remove it.
        -- if they remove it from cart but not done from 
            --actually buying it put it in wishlist
    -- once we checkout remove item from wishList and Cart 


    -- grab the total watches amount that has been selected from the user


    -- DELETE 


    FOREIGN KEY (wishListId) REFERENCES wishlist(wishListId),
    FOREIGN KEY (userId) REFERENCES tblUser(userId)

);