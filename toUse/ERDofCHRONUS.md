```mermaid
flowchart TD
    %% ==========================================
    %% ENTITIES (Rectangles)
    %% ==========================================
    brand[brand]
    movement[movement]
    complication[complication]
    users[users]
    watchType[watchType]
    watchTypeComplication[watchTypeComplication]
    watchInventory[watchInventory]
    listing[listing]
    wishlistItem[wishlistItem]
    cart[cart]
    cartItem[cartItem]
    orders[orders]
    orderItem[orderItem]
    %not to be used

    %% ==========================================
    %% RELATIONSHIPS (Diamonds)
    %% ==========================================
    R_Produces{produces}
    R_Powers{powers}
    R_HasComp{has}
    R_FeatIn{features in}
    R_Owns{owns}
    R_IsModelFor{is model for}
    R_ListedAs{listed as}
    R_AddsTo{adds to}
    R_SavedIn{saved in}
    R_HasCart{has cart}
    R_CartContains{contains}
    R_AddedAs{added as}
    R_Places{places}
    R_OrderIncludes{includes}
    R_SoldAs{sold as}

    %% ==========================================
    %% CONNECTIONS (Entities to Relationships)
    %% ==========================================
    brand --- R_Produces --- watchType
    movement --- R_Powers --- watchType
    watchType --- R_HasComp --- watchTypeComplication
    complication --- R_FeatIn --- watchTypeComplication
    users --- R_Owns --- watchInventory
    watchType --- R_IsModelFor --- watchInventory
    watchInventory --- R_ListedAs --- listing
    users --- R_AddsTo --- wishlistItem
    listing --- R_SavedIn --- wishlistItem
    users --- R_HasCart --- cart
    cart --- R_CartContains --- cartItem
    listing --- R_AddedAs --- cartItem
    users --- R_Places --- orders
    orders --- R_OrderIncludes --- orderItem
    listing --- R_SoldAs --- orderItem

    %% ==========================================
    %% KEY ATTRIBUTES (Ovals)
    %% ==========================================
    
    %% Brand
    brandId([_brandId_]) --- brand
    brandName([brandName]) --- brand

    %% Movement
    movementId([_movementId_]) --- movement
    moveType([moveType]) --- movement

    %% Complication
    complicationId([_complicationId_]) --- complication
    complicationName([complicationName]) --- complication

    %% Users
    userId([_userId_]) --- users
    email([email]) --- users

    %% WatchType
    watchId([_watchId_]) --- watchType
    model([model]) --- watchType

    %% WatchInventory
    inventoryId([_inventoryId_]) --- watchInventory
    serialNum([serialNum]) --- watchInventory

    %% Listing
    listingId([_listingId_]) --- listing
    askingPrice([askingPrice]) --- listing
    status([status]) --- listing

    %% Wishlist
    addedAt([addedAt]) --- wishlistItem

    %% Cart
    cartId([_cartId_]) --- cart

    %% Orders
    orderId([_orderId_]) --- orders
    confirmNum([confirmNum]) --- orders

    %% OrderItem
    salePrice([salePrice]) --- orderItem
