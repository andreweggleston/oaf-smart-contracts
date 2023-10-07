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
        uint256 alice_balance_initial = balanceSheet.balanceOf(alice);
        uint256 bob_balance_initial = balanceSheet.balanceOf(bob);

        vm.prank(alice);
        balanceSheet.transfer(bob, 5_000);

        uint256 alice_balance_after = balanceSheet.balanceOf(alice);
        uint256 bob_balance_after = balanceSheet.balanceOf(alice);
        assertEq(bob_balance_after, bob_balance_initial + 5_000);
        assertEq(alice_balance_after, alice_balance_initial - 5_000);
    }

    function testFail_transfer_more_than_balance() public {
        vm.prank(alice);

        balanceSheet.transfer(bob, 15_000);
    }
}
