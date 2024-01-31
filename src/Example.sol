// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import { TContext } from "./TContext.sol";

contract Example is TContext {
    function setTransientValue(uint256 value, address target, bytes memory payload) public newContext {
        uint256 ctx = context();

        assembly { tstore(ctx, value) }

        if (target == address(0)) return;

        (bool success,) = target.call(payload);

        require(success, "setTransientValue::call");
    }

    function getTransientValue() public view returns (uint256 value) {
        uint256 ctx = context();

        assembly { value := tload(ctx) }
    }
}

