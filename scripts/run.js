const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory('myNFT');

    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed at : " + nftContract.address);
};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    }
    catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();