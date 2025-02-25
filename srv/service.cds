using {sample.master as master, sample.trans as trans } from '../db/demo';

service Myservice{

    entity StudentSet as projection on master.student;
    entity StandardSet as projection on master.standard;
    entity BookSet as projection on master.book;
    entity BookRentalSet as projection on trans.rentals;
   
    
}