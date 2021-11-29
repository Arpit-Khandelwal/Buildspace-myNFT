//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
import "hardhat/console.sol";

contract myNFT is ERC721URIStorage{

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;


    string svg = "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: white; font-family: serif; font-size: 24px; }</style><rect width='100%' height='100%' fill='black' /><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";

    string[] randomWords = ["This", "is" ,"A", "Random", "Word", "SpongeBob", "Squarepants", "Rebecca", "Netflix" ];


    constructor() ERC721("Arpit's First NFT", "ARP"){
        console.log("calling constructor\n");
    }

    function randomWord(uint256 tokenId) public view returns (string memory)
    {
        uint256 rand=uint256(keccak256(abi.encodePacked(string(abi.encodePacked("Random data",Strings.toString(tokenId))))));

        rand = rand%randomWords.length;
        return randomWords[rand];
    }

    function makeNFT() public{
        uint256 newItemID = _tokenIds.current();

        string memory svgFinal = string(abi.encodePacked(svg,randomWord(newItemID),"</text></svg>"));

        _safeMint(msg.sender, newItemID);

        _setTokenURI(newItemID,"");

        console.log("NFT with ID %s is minted to %s with svg %s", newItemID,msg.sender,svgFinal);
        _tokenIds.increment();
    }
}