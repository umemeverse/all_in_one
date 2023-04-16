// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity >=0.4.22 <=0.8.0;

contract Context {
    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
}
