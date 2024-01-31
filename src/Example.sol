// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import { TContext } from "./TContext.sol";

contract Example is TContext {
    function setTransientValue(uint256 value, address target, bytes memory payload) public newContext {
        uint256 ctx = context();

        assembly { tstore(ctx, value) }

        (bool success,) = target.call(payload);

        require(success, "setTransientValue::call");
    }
}

