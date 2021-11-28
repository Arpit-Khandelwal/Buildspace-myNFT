//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
import "hardhat/console.sol";

contract myNFT is ERC721URIStrorage{

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Arpit's First NFT", "ARP"){
        console.log("my first NFT");
    }

    function makeNFT() public{
        uint256 newItemID = _tokenIds.current();

        _safeMint(msg.sender, newItemID);

        _setTokenURI(newItemID,"https://jsonkeeper.com/b/FC5W");

        console.log("NFT with ID %s is minted to %s", newItemID,msg.sender);
        _tokenIds.increment();
    }
}