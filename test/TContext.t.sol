// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import { Test } from "../lib/forge-std/src/Test.sol";

import { Example } from "../src/Example.sol";
import { NonReentrant } from "./mock/NonReentrant.sol";
import { Reentrant } from "./mock/Reentrant.sol";

contract TContextTest is Test {
    Example example;
    NonReentrant nonReentrant;
    Reentrant reentrant;

    function setUp() public {
        example = new Example();
        nonReentrant = new NonReentrant();
        reentrant = new Reentrant();
    }

    function testTransientVariableNonReentrant() public {
        example.setTransientValue(69_420, address(nonReentrant), abi.encodeCall(NonReentrant.setTVariable, ()));

        assertEq(69_420, nonReentrant.tVariable());
    }

    function testTransientVariableReentrant() public {
        example.setTransientValue(69_420, address(reentrant), abi.encodeWithSelector(Reentrant.reentrant.selector));

        assertEq(696969, reentrant.tVariable());
    }
}
