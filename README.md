NFT Standard on Flow
Flow does not have a standardized NFT contract like ERC-721 in Ethereum. However, developers can create their own NFT contracts in Cadence by implementing the necessary functionality to define, mint, transfer, and manage unique digital assets.

Cadence Smart Contracts for NFTs
Developers use Cadence to define the logic and behavior of NFT contracts on Flow. These smart contracts contain code for creating, transferring, and interacting with NFTs. Contracts often include storage for metadata, ownership information, and functions for token management.

NonFungibleToken Interface
The NonFungibleToken contract interface defines the structure and functionalities for handling Non-Fungible Tokens (NFTs) on the Flow blockchain. This interface can serve as a blueprint for developing NFT contracts in the Cadence programming language.

Contract Structure
totalSupply: Variable to track the total number of NFTs.
Events:
ContractInitialized: Event triggered when the contract is initialized.
Withdraw: Event triggered upon withdrawing an NFT from the collection.
Deposit: Event triggered upon depositing an NFT into the collection.
NFT Resources and Interfaces
INFT Interface: Defines the structure of an NFT resource with a unique ID.
NFT Resource: Implementation of the NFT interface with additional functions for views and resolving views.
Provider Interface: Interface for handling withdrawal of NFTs from the collection.
Receiver Interface: Interface for depositing NFTs into the collection.
CollectionPublic Interface: Public interface exposing deposit, ID retrieval, and borrowing NFT functionalities.
Collection Resource: Implementation of Provider, Receiver, and CollectionPublic interfaces with functions for managing NFTs within a collection.
Functions
withdraw: Removes an NFT from the collection and returns it to the caller.
deposit: Adds an NFT to the collection.
getIDs: Retrieves an array of IDs present in the collection.
borrowNFT: Borrows a reference to an NFT in the collection for reading data or calling methods.
createEmptyCollection Function
createEmptyCollection: Function to create an empty collection, ensuring that the created collection is indeed empty upon creation.


CryptoPoops NFT Contract
The CryptoPoops contract is a Non-Fungible Token (NFT) implementation that extends the NonFungibleToken interface on the Flow blockchain. It provides functionalities for creating, managing, and interacting with unique NFTs represented as CryptoPoops.

Contract Structure
totalSupply: Variable to track the total number of CryptoPoops NFTs.
Events:
ContractInitialized: Event triggered when the contract is initialized.
Withdraw: Event triggered upon withdrawing an NFT from the collection.
Deposit: Event triggered upon depositing an NFT into the collection.
NFT Resource Definition
NFT Resource: Represents a single CryptoPoops NFT, containing properties such as id, name, favouriteFood, and luckyNumber.
Initialized using provided parameters (name, favouriteFood, luckyNumber) to create a unique CryptoPoops NFT.
Interfaces and Resources
CollectionPublic Interface: Defines public functions for depositing, getting IDs, and borrowing NFTs.
Collection Resource: Implements functionalities for managing NFTs (Provider, Receiver, CollectionPublic). It maintains ownedNFTs and allows depositing, withdrawing, and borrowing of NFTs within the collection.
Minter Resource
Minter Resource: Provides functions to create new CryptoPoops NFTs (createNFT) and instantiate a new Minter.
Contract Initialization
Upon contract initialization (init()), totalSupply is set to 0, and a Minter instance is created and stored in the /storage/Minter.
Functions
createEmptyCollection: Function to create an empty collection of NFTs.

 Transaction Script
Transaction Script Purpose:
The provided transaction script is designed to interact with the CryptoPoops contract on the Flow blockchain. It performs the following actions:

Create and Store Collection:

It creates an empty collection of CryptoPoops NFTs using CryptoPoops.createEmptyCollection().
Saves this collection to the signer's account storage under /storage/Collection.
Exposing Collection Public Interface:

Links the CryptoPoops.CollectionPublic interface to /public/Collection separately.
Exposes functionalities such as deposit and getIDs publicly for the collection.
Script Structure and Flow:
The script is structured as a transaction on the Flow blockchain. It consists of two main sections:

Prepare Phase:

Uses prepare to set up actions before execution.
Creates an empty collection of CryptoPoops NFTs and saves it to the signer's storage.
Exposes the CollectionPublic interface for the stored collection.
Execute Phase:

Uses execute to perform actions after the prepare phase is completed.
Outputs a log message confirming the successful storage of the collection.
Usage Notes:
Ensure you have the correct contract addresses (0x06 and 0x05) for CryptoPoops and NonFungibleToken respectively.
Customize the log message or add additional actions as needed within the execute block.
This script assumes the existence and functionality of the CryptoPoops contract with the defined functionalities for creating collections and exposing public interfaces.


Transaction Script Purpose:
The provided transaction script is designed to mint a new Non-Fungible Token (NFT) using the CryptoPoops contract on the Flow blockchain and deposit it into the recipient's collection. It performs the following actions:

Retrieve Minter and Recipient's Collection:

Retrieves the Minter reference from the signer's account storage.
Retrieves the recipient's public Collection reference.
Mint and Deposit NFT:

Uses the Minter reference to create a new CryptoPoops NFT with provided metadata (name, favorite food, lucky number).
Deposits the newly minted NFT into the recipient's Collection.
Script Structure and Flow:
The script structure consists of two main sections:

Prepare Phase:

Gets references to the Minter and the recipient's public Collection.
Uses the Minter reference to create a new CryptoPoops NFT.
Deposits the created NFT into the recipient's collection.
Execute Phase:

Uses execute to perform actions after the prepare phase is completed.
Outputs a log message confirming the successful creation and storage of the NFT in the recipient's collection.
Usage Notes:
Ensure you have the correct contract addresses (0x06 and 0x05) for CryptoPoops and NonFungibleToken respectively.
Customize the log message or add additional actions as needed within the execute block.
This script assumes the existence and functionality of the CryptoPoops contract with the Minter capability and the recipient's public Collection.



 Cadence Script
Purpose of the Script:
The provided Cadence script aims to retrieve the IDs of the Non-Fungible Tokens (NFTs) stored in a user's collection on the Flow blockchain. It performs the following actions:

Retrieve Collection IDs:
Retrieves the public Collection reference for the provided account address.
Accesses the IDs of the NFTs stored in the collection.
Script Structure and Functionality:
The script structure is straightforward, designed as a Cadence function (main) that takes an address as a parameter and returns an array of UInt64 representing the IDs of the NFTs in the user's collection.

Usage Notes:
Ensure you have the correct contract addresses (0x06 and 0x05) for CryptoPoops and NonFungibleToken respectively.
The getIDs() function assumes the existence of the CollectionPublic interface in the CryptoPoops contract.
The script might panic if the provided account does not have a valid collection or the necessary interface is not available.

Purpose of the Script:
The provided Cadence script is designed to borrow and return a borrowed reference to a specific Non-Fungible Token (NFT) from a user's collection on the Flow blockchain. It performs the following actions:

Retrieve a Borrowed Reference to an NFT:
Retrieves the public Collection reference for the provided account address.
Borrows an authenticated reference to the specified NFT using its ID.
Script Structure and Functionality:
The script structure consists of a Cadence function (main) that takes two parameters: the account address and the ID of the desired NFT. It returns a borrowed authenticated reference to the specific NFT stored in the user's collection.

Usage Notes:
Ensure you have the correct contract addresses (0x06 and 0x05) for CryptoPoops and NonFungibleToken respectively.
The script assumes the existence of the CollectionPublic interface in the CryptoPoops contract and the capability to borrow authenticated NFT references.
It might panic if the provided account does not have a valid collection or if the specified NFT ID is not found.
