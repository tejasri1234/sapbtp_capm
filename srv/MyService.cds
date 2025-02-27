using { sample.cds } from '../db/CDSViews';


service MyService @(path: 'MyService'){
    function spiderman(name : String(20)) returns String;
    entity ProductOrderSet as projection on cds.CDSViews.ProdctOrders;

}
