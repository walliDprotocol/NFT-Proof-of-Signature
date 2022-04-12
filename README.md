# NFT Proof-of-Signature

## About this repo
This repo contains the code of the open-source components of WalliD ETH signatures for DocuSign.

## About WalliD ETH Signatures
>For a full overview of the project read our article [here]()

WalliD ETH signatures is an integration built by WalliD on top of DocuSign, Polygon and Areweave in order to allow Web3 users to sign PDFs with their Ethereum addresses or ENS domains and mint an NFT with the Proof-of-Signature.

- [WalliD](https://wallid.io)  is an open-source self-sovereign Ethereum wallet used in the conext of this project to authenticate users on DocuSign and sign the PDFs with the wallet keys.
- [DocuSign](https://www.docusign.com/) is the leading Electronic Signature platform that is used in the context of this project to manage users' documents and request signatures using WalliD's integration
- [Polygon](https://polygon.technology/)  is a decentralised Ethereum scaling platform that is used in the context of this project as the network hosting the ERC-1155 smart contract with the Proof-of-Signature NFTs
- [Areweave](https://www.arweave.org/) is a global permanent hard-drive used in the context of this project to store the original signed PDFs and provide the link to URI metadata for the NFTs on the smart contract.


### What's open-source?
 - WalliD Wallet
 - Proof-of-Signature Smart contract
 - NFT Metadata API

### What's not open-source?
 - DocuSign's backend

## How does it work?
>For a full-lenght tutorial read our article [here]()

1. Users activate a DocuSign account with WalliD's ETH signatures feature available on [WalliD's Website](https://wallid.io/Products/EthereumSignatures)
2. Users upload PDFs, customise the document visuals and send them to signers' email addresses through DocuSign platform
3. Signers open the document and are requested to authenticate with WalliD wallet
4. Signers review the document and sign it by approving the transaction in WalliD wallet
5. When all signatures are complete, WalliD's relayer stores the orginal final in Areweave
6. WalliD relayer mints an NFT for all signers under the ERC-1155 smart contract with the following elements:
    - NFT ID: unique identifier for the signed contract
    - Name of the document: fetched from DocuSing's backend
    - URI: link to original final in Areweave
    - hash: cryptographic proof-of-signature generated on DocuSign's backend
    - signers' wallet addresses: Extracted from WalliD wallet during the signing event
7. Original document holders can verify the signatures embedded in PDF
8. Anyone can verify the public signatures minted as NFTs on-chain or in NFT marketplaces such as OpenSea

## What's the status of the project?
- WalliD and DocuSign's backend integration complete and tested. See demo video [here] (https://www.youtube.com/watch?v=s6OsDNNHcqc)
- ERC-1155 smart contract deployed on Mumbay testnet. Check smart contract [here](https://mumbai.polygonscan.com/address/0x43Cceb10D3a3E3941e2466E4c513ea6Cc34285AD#readContract)
- OpeanSea collection with for Proof-of-signature NFTs created. see collection [here](https://testnets.opensea.io/collection/signed-document-info-v2)
- Areweave integration to store original signed files complete. See permaweb link [here](https://p3rqjvuflaxw5iukteor4qf2tl7vfi65oxpfr3lzfrd4kdyi.arweave.net/fuME1oVYL26_iipk_d-HkC6mv9So9113ljteSxHxQ8I)


## What's next?
- Implementing API to manage NFTs metadata on Areweave
- Launching the private beta and onboard first 200 users
- Audit smart contracts and backend integrations
- Launch on Mainnet and open to Public Beta
- Promote the project and onboard the first 1000 signers


