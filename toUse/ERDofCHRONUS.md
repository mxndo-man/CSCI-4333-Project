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
    %% ATTRIBUTES (Ovals)
    %% ==========================================
    
    %% Brand Attributes
    brandId([_brandId_]) --- brand
    brandName([brandName]) --- brand
    brandCountry([country]) --- brand
    foundedYear([foundedYear]) --- brand

    %% Movement Attributes
    movementId([_movementId_]) --- movement
    moveType([moveType]) --- movement
    moveSubType([moveSubType]) --- movement

    %% Complication Attributes
    complicationId([_complicationId_]) --- complication
    complicationName([complicationName]) --- complication

    %% User Attributes
    userId([_userId_]) --- users
    displayName([displayName]) --- users
    userPassword([userPassword]) --- users
    email([email]) --- users
    bankId([bankId]) --- users
    street([street]) --- users
    city([city]) --- users
    province([province]) --- users
    zip([zip]) --- users
    userCountry([country]) --- users

    %% WatchType Attributes
    watchId([_watchId_]) --- watchType
    model([model]) --- watchType
    classification([classification]) --- watchType
    bandWidth([bandWidth]) --- watchType
    caseSize([caseSize]) --- watchType
    caseMaterial([caseMaterial]) --- watchType
    bandMaterial([bandMaterial]) --- watchType
    dialColour([dialColour]) --- watchType

    %% WatchInventory Attributes
    inventoryId([_inventoryId_]) --- watchInventory
    yearOfProd([yearOfProd]) --- watchInventory
    watchCondition([watchCondition]) --- watchInventory
    serialNum([serialNum]) --- watchInventory

    %% Listing Attributes
    listingId([_listingId_]) --- listing
    askingPrice([askingPrice]) --- listing
    status([status]) --- listing
    listedAt([listedAt]) --- listing

    %% Wishlist Attributes
    addedAt([addedAt]) --- wishlistItem

    %% Cart Attributes
    cartId([_cartId_]) --- cart

    %% Orders Attributes
    orderId([_orderId_]) --- orders
    confirmNum([confirmNum]) --- orders
    confirmEmail([confirmEmail]) --- orders
    shipStreet([shipStreet]) --- orders
    shipCity([shipCity]) --- orders
    shipProvince([shipProvince]) --- orders
    shipZip([shipZip]) --- orders
    shipCountry([shipCountry]) --- orders
    createdAt([createdAt]) --- orders

    %% OrderItem Attributes
    salePrice([salePrice]) --- orderItem
