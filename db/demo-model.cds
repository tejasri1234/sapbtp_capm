namespace sampledb;
using {cuid,Currency} from '@sap/cds/common';

using{sample.commons as common} from './commons';

context master{
    entity businesspartner{
        Key NODE_KEY : common.Guide @title : '{i18n>PARTNER_GUID}';
        ADDRESS_GUID : Association to address;
        BP_ROLE: String(2);
        EMAIL_ADDRESS: String(105);
        PHONE_NUMBER:String(32);
        FAX_NUMBER : String(32);
        WEB_ADDRESS: String(44);
        BP_ID: String(32);
        COMPANY_NAME: String(250) @title : '{i18n>COMPANY_NAME}';


    }
    entity address{
        key NODE_KEY : common.Guide;
        CITY: String(44) @title : '{i18n>CITY}';
        POSTAL_CODE:String(44);
        STREET:String(44);
        BUILDING:String(44);
        COUNTRY:String(44) @title : '{i18n>COUNTRY}';
        ADDRESS_TYPE:String(44);
        VAL_START_DATE: Date;
        VAL_END_DATE:Date;
        LATITUDE:Decimal;
        LONGITUDE:Decimal;
        businesspartner:Association to one businesspartner on businesspartner.ADDRESS_GUID = $self;


    }

    entity product{
        key NODE_KEY : common.Guide @title : '{i18n>PRODUCT_GUIDE}';
        PRODUCT_ID:String(28);
        TYPE_CODE : String(2);
        CATEGORY : String(32);
        DESCRIPTION : localized String(255) @title : '{i18n>PARTNER_NAMEE}';
        SUPPLIER_GUID : Association to master.businesspartner;
        TAX_TARIF_CODE: Integer;
        MEASURE_UNIT: String(2);
        WEIGHT_UNIT:String(2);
        WEIGHT_MEASURE:Decimal(5,2);
        CURRENCY_CODE: String(4);
        PRICE:Decimal(15,2);
        WIDTH:Decimal(5,2);
        HEIGHT:Decimal(5,2);
        DEPTH:Decimal(5,2);
        DIM_UNIT : String(2);

    }
    entity  employees : cuid {
        nameFirst : String(40);
        nameMiddle : String(40);
        nameLast : String(40);
        nameInitials : String(32);
        sex : common.Gender;
        language : String(2);
        phoneNumber : common.PhoneNumber;
        email : common.Email;
        loginName : String(12);
        CURRENCY : Currency;
        salaryAmount : common.AmountT;
        accountNumber: String(16);
        bankId : String(80);
        bankName : String(30);
        
    }

}

context transaction{
    entity purchaseorder : common.Amount{
        key NODE_KEY : common.Guide @title : '{i18n>PO_KEY}';
        PO_ID : String(40) @title : '{i18n>PO_ID}';
        PARTNER_GUID : Association to master.businesspartner;
        LIFECYCLE_STATUS : String(20);
        OVERALL_STATUS : String(20) @title : '{i18n>OVERALL_STATUS}';
        ITEMS : Composition of many poitems on ITEMS.PARENT_KEY = $self;

    }
    entity poitems : common.Amount{
        key NODE_KEY : common.Guide;
        PARENT_KEY : Association to  purchaseorder;
        PO_ITEM_POS : Integer @title : '{i18n>PO_NO_ID}';
        PRODUCT_GUIDE : Association to master.product;

    }
    


}