# NFT Proof-of-Signature

## About this repo
This repo contains the code of the open-source components of WalliD ETH signatures for DocuSign.

## About WalliD ETH Signatures
>For a full overview of the project read our article [here](https://medium.com/@WalliD/wallid-docusign-pdf-signatures-with-ethereum-addresses-are-coming-to-the-metaverse-a3c6b2101ddd)

WalliD ETH signatures is a service built by WalliD on top of DocuSign, Polygon and Areweave in order to allow Web3 users to sign PDFs with Ethereum addresses or ENS domains and to back the Proof-of-Signature as an NFT.

- [WalliD](https://wallid.io)  is an open-source self-sovereign Ethereum wallet used in the conext of this project to authenticate users on DocuSign and sign the PDFs with the wallet keys.
- [DocuSign](https://www.docusign.com/) is the leading Electronic Signature platform that is used in the context of this project to manage users' documents and request signatures using WalliD's integration
- [Polygon](https://polygon.technology/)  is a decentralised Ethereum scaling platform that is used in the context of this project as the network hosting the ERC-1155 smart contract with the Proof-of-Signature NFTs
- [Areweave](https://www.arweave.org/) is a global permanent hard-drive used in the context of this project to store the original signed PDFs and provide the link to URI metadata for the NFTs on the smart contract.


### What's open-source?
 - [MyWalliD Wallet](https://github.com/walliDprotocol/MyWalliD-Wallet)
 - Proof-of-Signature Smart contract

### What's not open-source?
 - DocuSign's backend
 - DocuSign's integration with WalliD's relayer
 - 
## How does it work?
>For a full-lenght tutorial read our article [here](https://medium.com/@WalliD/how-to-sign-with-mywallid-on-docusign-7ab0ab821b6)

1. Users activate a DocuSign account with WalliD's ETH signatures Type available on [WalliD's Website](https://wallid.io/Products/EthereumSignatures).
2. Users upload PDFs, customise the document visuals and send them to signers' email addresses through DocuSign platform.
3. Signers open the document and authenticate with MyWalliD wallet.
4. Signers review the document and sign it by approving the transaction in MyWalliD wallet.
5. When all signatures are complete, WalliD's relayer stores the orginal final in Areweave.
6. WalliD relayer mints an NFT for all signers under an ERC-1155 smart contract with the following elements:
    - NFT ID: unique identifier for the signed contract;
    - Name of the document: fetched from DocuSing's backend;
    - URI: link to original final in Areweave;
    - hash: cryptographic proof-of-signature generated on DocuSign's backend;
    - signers' wallet addresses: Extracted from MyWalliD wallet during the signing event;
7. Original document holders can verify the signatures embedded in PDF.
8. Anyone can verify the public signatures minted as NFTs on-chain or in NFT marketplaces such as OpenSea under [WalliD's collection](https://testnets.opensea.io/collection/wallid-pos-ntfs](https://testnets.opensea.io/collection/wallid-proof-of-signature-nfts))

### Document Signature and NFT minting flow:

![image](https://user-images.githubusercontent.com/39834004/170519791-f53f2d4c-d303-45dc-b377-83173c7bf2f5.png)


## What's the status of the project?
- WalliD and DocuSign's backend integration complete and tested. See demo video [here](https://www.youtube.com/watch?v=s6OsDNNHcqc)
- ERC-1155 smart contract deployed on Mumbaoi testnet. Check smart contract [here](https://mumbai.polygonscan.com/address/0x1B58E3347E5cC1F5A787f3A719bC042ef17d7324))
- OpeanSea collection with for Proof-of-signature NFTs created. see collection [here](https://testnets.opensea.io/collection/wallid-pos-ntfs)
- Areweave integration to store original signed files complete. See an example of a signed document stored permanetly [here](https://arweave.net/zTusWTpK0cfn5AKGO85PDlwvBuEZKqMic9gijTBLVmM)


## What's next?
- Launching the private beta and onboard first 100 users
- Audit Proof-of-signature smart contract
- Launch on Mainnet and open to Public Beta



