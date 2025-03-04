using { sampledb.master,sampledb.transaction } from '../db/demo-model';

service CatalogService @(path:'CatalogService'){

   entity BusinessPartnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;

    //@readonly
    entity EmployeeSet as projection on master.employees;
    entity ProductSet as projection on master.product;
    entity POs as projection on transaction.purchaseorder
    actions{
        action boost() returns POs;
        function largestOrder() returns POs;
    };
    entity POItems as projection on transaction.poitems;

}