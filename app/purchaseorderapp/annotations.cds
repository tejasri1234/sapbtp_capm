using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(
    UI.SelectionFields : [
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        GROSS_AMOUNT
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME ,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
    
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.boost',
            Label : 'Boost',
            Inline : true,
        },
        {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS,
            Criticality : ColorCoding,
        }
    ],
    UI.HeaderInfo : {
        TypeName : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        Title : {
            $Type : 'UI.DataField',
            Value : PO_ID,

        },
        Description : {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,

        },
        ImageUrl : 'https://cdn.iconscout.com/icon/free/png-256/free-sap-logo-icon-download-in-svg-png-gif-file-formats--technology-social-media-vol-6-pack-logos-icons-2945134.png',
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'More Info',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Additional Data',
                    Target : '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Pricing Data',
                    Target : '@UI.FieldGroup#field1',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Status Data',
                    Target : '@UI.FieldGroup#field2',
                },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'ITEMS/@UI.LineItem#items',
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID_NODE_KEY,
        },
        
    ],
    UI.FieldGroup #field1 : {
        Label : 'Price Data',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            
        ],
    },
    UI.FieldGroup #field2 : {
        Label : 'Status',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
            },
        ],
    },

);

annotate service.POItems with @(
    UI.LineItem #items: [
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUIDE_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
    ],
    UI.HeaderInfo :  {
        TypeName : '',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUIDE.DESCRIPTION,
        },
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Item Info',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Details',
                    Target : '@UI.FieldGroup#ItemDetail',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Price',
                    Target : '@UI.FieldGroup#Pricing',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Product Details',
                    Target : '@UI.FieldGroup#Products',
                },
            ],
        }, 
    ],
    UI.FieldGroup #ItemDetail: {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUIDE_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
        ],
    },
    UI.FieldGroup #Pricing: {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
        ],
    },
    UI.FieldGroup #Products: {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUIDE.DESCRIPTION,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUIDE.CATEGORY,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUIDE.PRICE,
            },
        ],
    }
    
);

annotate service.POItems with {
    PRODUCT_GUIDE @(
        Common.Text :PRODUCT_GUIDE.DESCRIPTION,
        Common.ValueList.entity : service.ProductSet,
    );
} ;

annotate service.POs with {
    PARTNER_GUID @(
        Common.Text :PARTNER_GUID.COMPANY_NAME,
        Common.ValueList.entity : service.BusinessPartnerSet
    );
} ;


@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(
    UI.Identification :[
        {
            $Type : 'UI.DataField',
            Value : COMPANY_NAME,
        },

]) ;
annotate service.ProductSet with @(
    UI.Identification :[
        {
            $Type : 'UI.DataField',
            Value : DESCRIPTION,
        },

]) ;

