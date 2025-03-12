using { sampledb.master,sampledb.transaction } from '../db/demo-model';

service CatalogService @(path:'CatalogService'){

   entity BusinessPartnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;

    //@readonly
    entity EmployeeSet as projection on master.employees;
    entity ProductSet as projection on master.product;
    function hey() returns POs;
    entity POs @(
        odata.draft.enabled : true,
        Common.DefaultValuesFunction : 'hey'
    )as projection on transaction.purchaseorder{
        *,
        CASE OVERALL_STATUS
            when 'Completed' then 3
            when 'Cancelled' then 1
            when 'Pending' then 2 end as ColorCoding : Integer,
        ITEMS
    }
    actions{
        @cds.odata.bindingparameter.name : '_variable'
        @Common.SideEffects : {
            TargetProperties : ['_variable/GROSS_AMOUNT']
        }
        action boost() returns POs;
        function largestOrder() returns POs;
    };
    entity POItems as projection on transaction.poitems;

}