var express = require("express");
var app = express();
var cors = require('cors')

const ALLOWED_HEADERS=`*`
const ALLOWED_ORIGINS=`*`

function parseValues(originalValues) {
    let parsedValues = originalValues;
    if (originalValues.includes(',')) {
      parsedValues = originalValues.split(',');
    }
    return parsedValues;
}

let corsOpts = {};
const origin = parseValues(ALLOWED_ORIGINS);
const allowedHeaders = parseValues(ALLOWED_HEADERS);
corsOpts = ({
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  preflightContinue: true,
  allowedHeaders,
  origin,
});


// enable cors
app.use(cors(corsOpts))

let port = process.env.PORT || 3000;
app.listen(port, () => 
{
    console.log("Server running on port ", port);
});


app.get("/esign/contract", (req, res, next) => 
{
    let path = ''
    let info = {};
    info.banner = path;
    info.image = path;
    info.banner_url = path;
    info.name = "Signed Documents for DocuSign TSP";
    info.description = "WalliD eSign for TSP NFT collection";
    res.json( info );
});


app.get("/esign/contract/detail/:id", (req, res, next) => 
{
    let id = req.params.id; //parseInt(req.params.id, 16);


    res.json( {
        id,
        name :  "Signed Documents for DocuSign TSP",
        description : "WalliD eSign for TSP NFT collection",
        externalURL : "",
        image       : "",

    });

    
});