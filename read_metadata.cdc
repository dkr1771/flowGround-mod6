import NonFungibleToken from 0x05
import CryptoPoops from 0x06
pub fun main(address: Address, id: UInt64) {
  let recipientsCollection = getAccount(address).getCapability(/public/MyCollection)
              .borrow<&CryptoPoops.Collection{CryptoPoops.CollectionPublic}>()
              ?? panic("The address does not have a Collection.")
  
  let nftRef: &CryptoPoops.NFT = recipientsCollection.borrowAuthNFT(id: id)
  log(nftRef.name) 
  log(nftRef.favouriteFood) 
  log(nftRef.luckyNumber) 
}
