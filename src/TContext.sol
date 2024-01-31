// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

abstract contract TContext {
    error EmptyContext();

    uint256 internal constant contextSlot = 0;

    modifier newContext() {
        pushContext();
        _;
        popContext();
    }

    function context() internal view returns (uint256 ctx) {
        assembly {
            ctx := tload(contextSlot)
        }
    }

    function pushContext() private {
        assembly {
            tstore(contextSlot, add(1, tload(contextSlot)))
        }
    }

    function popContext() private {
        uint256 ctx = context() - 1;
        assembly {
            tstore(contextSlot, ctx)
        }
    }
}
