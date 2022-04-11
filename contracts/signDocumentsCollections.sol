// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract SimpleAccessControl {

    address internal _owner;


    modifier isOwner() {
        require(msg.sender == _owner, "ERR_NOT_OWNER");
        _;
    }
    /*
    constructor(address payable ownerAdress) {
        _owner = ownerAdress; 
    }
    */
    constructor() {
        _owner = msg.sender; 
    }

    function transferOwnership(address payable newOwner) public isOwner {
        require(newOwner != address(0), "ERR_ZERO_ADDR");
        require(newOwner != _owner, "ERR_IS_OWNER");
        _owner =   newOwner;
    }
}

contract eSignDocsCollection  is ERC1155, SimpleAccessControl 
{
    
    uint256 private _id = 0;
    string public name;
    string private _contractURI;

   mapping(uint256 => DocumentInfo) private _idsToDocument;
   mapping(bytes => uint256) private _hashDocToNftId;
   //mapping(address => uint256[]) private  _signersToIds;

    struct DocumentInfo 
    {
        address[] signers;
        bytes32 envelopeId;
        bytes documentHash;
        uint256 nftId;
    }


    constructor() public ERC1155("https://demo.api.wallid/api/v1/documentsMetadata/detail/{id}")
    {
        _contractURI = "https://demo.api.wallid/api/v1/documentsMetadata/detail/";
        name = "Signed Document Info";
       
    }

    // get nft info based on id
    function getSignersInfo (uint256 id ) public view returns (address[] memory, bytes32, bytes memory) {
        return (_idsToDocument[id].signers, _idsToDocument[id].envelopeId, _idsToDocument[id].documentHash);    
    }

     // get nft info based on document hash
     function getSignersInfo (bytes memory docHash ) public view returns (address[] memory, bytes32, bytes memory) 
     {
        uint256 _id = _hashDocToNftId[docHash];
        return (_idsToDocument[_id].signers, _idsToDocument[_id].envelopeId, _idsToDocument[_id].documentHash);    
     }


    function mintDocument( address[] memory signers, bytes32 envelopeId, bytes memory docHash   ) public returns (bool)
    {
        _id = _id +1; 
       
        //DocumentInfo storage newDocInfo = DocumentInfo(signers, envelopeId ,  docHash , newId );

        // fooStruct myStruct = fooStruct({foo:1, fighter:2});

        // store document struct
        _idsToDocument[_id].signers = signers;
        _idsToDocument[_id].envelopeId = envelopeId;
        _idsToDocument[_id].documentHash = docHash;
        _idsToDocument[_id].nftId = _id;
        // hash document to id
        _hashDocToNftId[docHash] = _id;
     

        for (uint i = 0; i<signers.length; i++) 
        {
            _mint(signers[i], _id, 1, "");
        }

        return true;
    }

    /*
    function mint(uint256 total) public returns (bool)
    {
        require( (total >= 1 && total <= 10) , 'NFT_MINT: GREATER THEN 1 LESS THEN 10' );
        _mint(msg.sender, _id++, (total) * (1 ether), "");
        return true;
    }
    */

    /* Metadata information */
    /* set uri of itens */
    function setURI(string memory newuri)  public  isOwner() returns (bool){
        _setURI(newuri);
        return true;
    }

    /* setContract uri  */
    function setContractURI(string memory newuri)  public  isOwner() returns (bool)
    {
        _contractURI = newuri;
        return true;
    }

    /* set Collection name  */
    function setCollectionName(string memory _name)  public  isOwner() returns (bool)
    {
        name = _name;
        return true;
    }

    /* Contract URL for with metada information  */
    function contractURI() public view returns (string memory) {
        return _contractURI;
    }

}