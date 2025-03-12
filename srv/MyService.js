const cds = require('@sap/cds');
const { format } = require('@sap/cds/lib/utils/cds-utils');
const {employees} = cds.entities("sampledb.master");

module.exports = (srv) => {
    srv.on('spiderman', req => `Hello ${req.data.name}`);

    srv.on('READ','ReadEmpsrv',async(req) => {
        // 1.Calling db and adding extra logic
        // return{
        //     "ID" : "16",
        //     "nameFist" : "Tom"

        // }
        const tx = await cds.tx(req);
        // 2.Read and manipulate data
        // var results = await tx.run(SELECT.from(employees).limit(5));
        // var returndata = [];
        // for(let i = 0; i < results.length; i++){
        //     const element = results[i];

        //     element.nameMiddle  = "badiya";
        //      returndata.push(element);


        // }
        // return results;


        //3.Working with condition
        var where = req.data;
        if(where.hasOwnProperty("ID")){
        return await tx.run(SELECT.from(employees).where(where));

        }else{
            return await tx.run(SELECT.from(employees).limit(2).where({
                "sex" : 'F'
            }));
    
        }
    });
}