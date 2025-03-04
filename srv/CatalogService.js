const { parse } = require("@sap/cds/lib/compile/etc/yaml");

module.exports = cds.service.impl(async function(){

    const {POs} = this.entities;

    
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
});