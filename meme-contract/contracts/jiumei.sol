// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity >=0.4.22 <=0.8.0;

import "./ERC20.sol";
import "./ERC20Detail.sol";
import "./context.sol";

contract JiuMei is ERC20, ERC20Detailed, Context {
    constructor () ERC20Detailed("OKex", "JiuMei", 8) public {
        super._mint(_msgSender(), 10**15 * 10**8);
    }

    function burn(uint256 amount) public returns (bool) {
        super._burn(_msgSender(), amount);
        return true;
    }
}
