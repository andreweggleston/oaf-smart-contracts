// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BalanceSheet} from "../src/BalanceSheet.sol";
import {Test} from "forge-std/Test.sol";

contract BalanceSheetTest is Test {
    BalanceSheet public balanceSheet;
    address internal constant alice = address(1);
    address internal constant bob = address(2);

    function setUp() public {
        vm.prank(alice);
        balanceSheet = new BalanceSheet();
    }

    function test_create() public {
        assertEq(balanceSheet.balanceOf(alice), 10_000);
    }

    function testFail_transfer_from_empty() public {
        vm.prank(bob);

        balanceSheet.transfer(alice, 10);
    }

    function test_transfer() public {
        vm.prank(alice);

        balanceSheet.transfer(bob, 5_000);
    }

    function testFail_transfer_more_than_balance() public {
        vm.prank(alice);

        balanceSheet.transfer(bob, 15_000);
    }
}
