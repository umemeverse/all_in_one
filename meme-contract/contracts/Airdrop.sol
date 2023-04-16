// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <=0.8.0;

import "./IERC20.sol";
import "./owner.sol";

contract Airdrop is Ownable {
  mapping(address => uint) public lastEpoch;        // token last claim epoch
  mapping(address => uint) public countPerEpoch;    // token => count per epoch
  mapping(address => uint) public airdropUnit;     // tokenAddress => unit
  mapping(address => mapping(uint => uint)) public leftCopies; // tokenAddress => (epoch => leftCopies)
  mapping(address => mapping(address => uint)) public userClaimTimes; // tokenAddress => (userAddress => claimTime)
  mapping(address => mapping(address => uint)) public userLastClaimEpoch;

  function epoch() public view returns (uint) {
    return (block.number - 7340000) / 28800 + 1;
  }

  function setUnit(address token, uint unit, uint count) public onlyOwner {
    airdropUnit[token] = unit;
    countPerEpoch[token] = count;
  }
  
  function canClaim(address token, address userAddress) public view returns (bool) {
    uint currentEpoch = epoch();
    uint left = leftCopies[token][currentEpoch];
    return left > 0 && userClaimTimes[token][userAddress] < 3 && userLastClaimEpoch[token][userAddress] < currentEpoch;
  }

  function claim(address token) public returns (bool) {
    uint currentEpoch = epoch();
    address userAddress = msg.sender;
    if (currentEpoch > lastEpoch[token]) {
        lastEpoch[token] = currentEpoch;
        leftCopies[token][currentEpoch] = countPerEpoch[token];
    }
    require(canClaim(token, userAddress), "do not satisfy our rules");

    leftCopies[token][currentEpoch] = leftCopies[token][currentEpoch] -1;
    userClaimTimes[token][userAddress] = userClaimTimes[token][userAddress] + 1;
    userLastClaimEpoch[token][userAddress] = currentEpoch;
    IERC20(token).transfer(userAddress, airdropUnit[token]);
  }
  
  function withdrawERC20(address token, uint count) public onlyOwner {
    IERC20 ERC20 = IERC20(token);
    ERC20.transfer(owner(), count);
  }
  
  function withdraw(address payable receiver, uint count) public onlyOwner {
    receiver.transfer(count);
  }
}
