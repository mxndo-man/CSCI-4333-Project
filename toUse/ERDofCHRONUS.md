```mermaid
erDiagram
    brand ||--o{ watchType : "produces"
    brand {
        INT brandId PK "AUTO_INCREMENT"
        VARCHAR brandName "UNIQUE"
        VARCHAR country 
        SMALLINT foundedYear 
    }

    movement ||--o{ watchType : "powers"
    movement {
        INT movementId PK "AUTO_INCREMENT"
        VARCHAR moveType 
        VARCHAR moveSubType 
    }

    complication ||--o{ watchTypeComplication : "features in"
    complication {
        INT complicationId PK "AUTO_INCREMENT"
        VARCHAR complicationName "UNIQUE"
    }

    users ||--o{ watchInventory : "owns"
    users ||--o{ wishlistItem : "adds to"
    users ||--|| cart : "has"
    users ||--o{ orders : "places"
    users {
        INT userId PK "AUTO_INCREMENT"
        VARCHAR displayName 
        VARCHAR userPassword 
        VARCHAR email "UNIQUE"
        BIGINT bankId 
        VARCHAR street 
        VARCHAR city 
        VARCHAR province 
        VARCHAR zip 
        VARCHAR country 
    }

    watchType ||--o{ watchTypeComplication : "has"
    watchType ||--o{ watchInventory : "is model for"
    watchType {
        INT watchId PK "AUTO_INCREMENT"
        INT brandId FK 
        VARCHAR model 
        INT movementId FK 
        VARCHAR classification 
        INT bandWidth 
        DECIMAL caseSize 
        VARCHAR caseMaterial 
        VARCHAR bandMaterial 
        VARCHAR dialColour 
    }

    watchTypeComplication {
        INT watchId PK,FK 
        INT complicationId PK,FK 
    }

    watchInventory ||--o{ listing : "listed as"
    watchInventory {
        INT inventoryId PK "AUTO_INCREMENT"
        INT userId FK 
        INT watchId FK 
        SMALLINT yearOfProd 
        VARCHAR watchCondition 
        VARCHAR serialNum "UNIQUE"
    }

    listing ||--o{ wishlistItem : "saved in"
    listing ||--o{ cartItem : "added as"
    listing ||--|| orderItem : "sold as"
    listing {
        INT listingId PK "AUTO_INCREMENT"
        INT inventoryId FK 
        DECIMAL askingPrice 
        ENUM status 
        TIMESTAMP listedAt 
    }

    wishlistItem {
        INT userId PK,FK 
        INT listingId PK,FK 
        TIMESTAMP addedAt 
    }

    cart ||--o{ cartItem : "contains"
    cart {
        INT cartId PK "AUTO_INCREMENT"
        INT userId FK "UNIQUE"
    }

    cartItem {
        INT cartId PK,FK 
        INT listingId PK,FK 
    }

    orders ||--o{ orderItem : "includes"
    orders {
        INT orderId PK "AUTO_INCREMENT"
        INT userId FK 
        BIGINT confirmNum "UNIQUE"
        VARCHAR confirmEmail 
        VARCHAR shipStreet 
        VARCHAR shipCity 
        VARCHAR shipProvince 
        VARCHAR shipZip 
        VARCHAR shipCountry 
        TIMESTAMP createdAt 
    }

    orderItem {
        INT orderId PK,FK 
        INT listingId PK,FK "UNIQUE"
        DECIMAL salePrice 
    }