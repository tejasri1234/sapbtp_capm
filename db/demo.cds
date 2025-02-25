namespace sample;
using {sample.commons as something } from './commons';
using { cuid, temporal, managed } from '@sap/cds/common';


context master{


    entity student : something.address {
        key ID : String(32);
        NAME : String(80);
        CLASS : Association to one standard;
        GENDER : String(1);
        CITY : String(10);
    }

    entity standard{
        key ID : String;
        CLASSNAME :String;
        SECTIONS : String;
        CLASSTEACHER : String;
    }
    entity book{
        key ID : String(32);
        BOOKNAME : String(30);
        AUTHOR : String(80);

    }

}

context trans{
    entity rentals : cuid, temporal, managed{
        STUDENT : Association to master.student;
        BOOK : Association to master.book;


    }
}