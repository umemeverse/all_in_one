// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity >=0.4.22 <=0.8.0;

import './owner.sol';

contract TimeLockedAdmin is Ownable {
    address payable public timeLockedAdmin;
    uint256 public effectTime;

    event SetAdmin(address indexed admin);
    event RenounceAdmin();

    constructor(uint256 _effectTime) public {
        effectTime = _effectTime;
    }

    modifier onlyAdmin {
        require(isAdmin(), "REQUIRE ADMIN");
        _;
    }

    function setAdmin() public onlyOwner returns (bool) {
        timeLockedAdmin = _msgSender();

        emit SetAdmin(_msgSender());
        return true;
    }

    function renounceAdmin() public onlyAdmin returns (bool) {
        timeLockedAdmin = address(0);

        emit RenounceAdmin();

        return true;
    }

    function isAdmin() private view returns (bool) {
        return timeLockedAdmin != address(0) && timeLockedAdmin == _msgSender() && block.timestamp >= effectTime;
    }
}
