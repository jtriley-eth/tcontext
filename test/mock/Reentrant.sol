// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Example} from "../../src/Example.sol";

contract Reentrant {
    uint256 public tVariable;

    function reentrant() public {
        Example(msg.sender).setTransientValue(696969, address(this), abi.encodeWithSelector(this.getTVariable.selector));
    }

    function getTVariable() public {
        tVariable = Example(msg.sender).getTransientValue();
    }
}
