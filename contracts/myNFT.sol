//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
import "hardhat/console.sol";

contract myNFT is ERC721URIStorage{

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Arpit's First NFT", "ARP"){
        console.log("my first NFT");
    }

    function makeNFT() public{
        uint256 newItemID = _tokenIds.current();

        _safeMint(msg.sender, newItemID);

        _setTokenURI(newItemID,"data:application/json;base64,eyJuYW1lIjoiQXJwaXQtS2hhbmRlbHdhbCIsImRlc2NyaXB0aW9uIjoiT25saW5lIGNsYXNzZXMgc3VjayIsImltYWdlIjoiPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHByZXNlcnZlQXNwZWN0UmF0aW89InhNaW5ZTWluIG1lZXQiIHZpZXdCb3g9IjAgMCAzNTAgMzUwIj4KICAgIDxzdHlsZT4uYmFzZSB7IGZpbGw6IHdoaXRlOyBmb250LWZhbWlseTogc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsgfTwvc3R5bGU+CiAgICA8cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSJibGFjayIgLz4KICAgIDx0ZXh0IHg9IjUwJSIgeT0iNTAlIiBjbGFzcz0iYmFzZSIgZG9taW5hbnQtYmFzZWxpbmU9Im1pZGRsZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+R2V0TWVBbkludGVybnNoaXA8L3RleHQ+Cjwvc3ZnPiJ9");

        console.log("NFT with ID %s is minted to %s", newItemID,msg.sender);
        _tokenIds.increment();
    }
}