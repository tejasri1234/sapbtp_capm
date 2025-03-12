const { parse } = require("@sap/cds/lib/compile/etc/yaml");

module.exports = cds.service.impl(async function(){

    const {POs,EmployeeSet} = this.entities;

    this.on('boost',async(req) => {
        try{
            const ID = req.params[0];
            const tx = cds.tx(req);
            await tx.update(POs).with({
                GROSS_AMOUNT: {"+=" : "20000"}
            }).where(ID);
        }
        catch(error){
            return error.toString();
        }
    });


    this.on('largestOrder',async(req) =>{
        console.log('aa gaya');

        try {
            const tx = cds.tx(req);
            const readData = tx.read(POs).orderBy({
                GROSS_AMOUNT : 'desc'
            }).limit(1);
            return readData;
        } catch (error) {
            return "Error" + error.toString();
            
        }
        
    });

    this.on('hey',async(req,res) => {
        return {
            "OVERALL_STATUS" : "N"
        };
    });
});