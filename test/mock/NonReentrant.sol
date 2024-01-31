// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import { Example } from "../../src/Example.sol";

contract NonReentrant {
    uint256 public tVariable;

    function setTVariable() public {
        tVariable = Example(msg.sender).getTransientValue();
    }
}
