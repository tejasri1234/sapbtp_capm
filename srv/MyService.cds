using {  sample.cds } from '../db/CDSViews';
using { sampledb.master } from '../db/demo-model';

service MyService @(path: 'MyService'){
    function spiderman(name : String(20)) returns String;
    entity ProductOrderSet as projection on cds.CDSViews.ProdctOrders{
        *,
        PO_ORDERS
    };
    entity ReadEmpsrv as projection on master.employees;
}
