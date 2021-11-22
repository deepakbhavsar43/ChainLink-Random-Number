pragma solidity 0.6.6;

import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";
// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract RandomNumberConsumer is VRFConsumerBase {

    bytes32 public keyHash;
    uint256 public fee;
    uint256 public randomResult;
    // address public linkContract = ""; //rinkeby faucet

    constructor() VRFConsumerBase (0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B, 0x01BE23585060835E02B77ef475b0Cc51aA1e0709) public {
        keyHash = 0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311;
        fee = 0.1 * 10 ** 18; // 0.1 LINK
    }

    function getRandomNumber(uint256 userProvidedSeed) public returns(bytes32 requestId) {
        return requestRandomness(keyHash, fee);
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomResult = randomness;
    }

    // function withdrawLink() public returns(bool){
    //     IERC20 link = IERC20(linkContract);
    //     link.transfer(this.address, "0xc91D8A4058a14bf0F733D89bcCDccC16E1B637B4");
    //     return true;
    // }

    // function contractBalance() public returns(uint256) {
    //     IERC20 link = IERC20(0x01be23585060835e02b77ef475b0cc51aa1e0709);
    //     return link.balanceOf(this.address);
    // }
}
