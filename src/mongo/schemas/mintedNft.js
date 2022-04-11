const Schema = require('mongoose').Schema;

const SignDocumentSchema = new Schema({

    nft_id: String,
    nft_name: String,
    nft_description : String,
    nft_externalURL : String,
    nft_image       : String,

    isMinted      : Boolean,
    documentHash  : String, 
    envelopId     : String,
    documentTitle : String,
    signers : []


},
{ collection: 'signDocument', versionKey: false });
SignDocumentSchema.set('timestamps', true);


module.exports = SignDocumentSchema
