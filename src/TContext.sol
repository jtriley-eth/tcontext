// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

abstract contract TContext {
    error EmptyContext();

    uint256 internal constant contextSlot = 0;

    modifier newContext() {
        pushContext();
        _;
    }

    function context() internal view returns (uint256 ctx) {
        assembly {
            mstore(0x00, tload(contextSlot))
            ctx := keccak256(0x00, 0x20)
        }
    }

    function pushContext() private {
        assembly {
            tstore(contextSlot, add(tload(contextSlot), 1))
        }
    }
}
