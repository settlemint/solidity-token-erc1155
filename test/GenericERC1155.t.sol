// SPDX-License-Identifier: FSL-1.1-MIT
pragma solidity ^0.8.24;

import { Test, console } from "forge-std/Test.sol";
import { GenericERC1155 } from "../contracts/GenericERC1155.sol";

contract GenericERC1155Test is Test {
    GenericERC1155 public genericERC1155;
    address public owner;
    address public user1;
    address public user2;

    function setUp() public {
        owner = address(this);
        user1 = address(0x1);
        user2 = address(0x2);
        genericERC1155 = new GenericERC1155();
    }

    function testInitialState() public view {
        assertEq(genericERC1155.owner(), owner);
        assertEq(genericERC1155.uri(0), "");
    }

    function testSetURI() public {
        string memory newURI = "https://example.com/token/";
        genericERC1155.setURI(newURI);
        assertEq(genericERC1155.uri(0), newURI);
    }

    function testSetURINotOwner() public {
        vm.prank(user1);
        vm.expectRevert();
        genericERC1155.setURI("https://example.com/token/");
    }

    function testMint() public {
        uint256 tokenId = 1;
        uint256 amount = 100;
        genericERC1155.mint(user1, tokenId, amount, "");
        assertEq(genericERC1155.balanceOf(user1, tokenId), amount);
    }

    function testMintNotOwner() public {
        vm.prank(user1);
        vm.expectRevert();
        genericERC1155.mint(user2, 1, 100, "");
    }

    function testMintBatch() public {
        uint256[] memory ids = new uint256[](2);
        ids[0] = 1;
        ids[1] = 2;
        uint256[] memory amounts = new uint256[](2);
        amounts[0] = 100;
        amounts[1] = 200;
        genericERC1155.mintBatch(user1, ids, amounts, "");
        assertEq(genericERC1155.balanceOf(user1, 1), 100);
        assertEq(genericERC1155.balanceOf(user1, 2), 200);
    }

    function testMintBatchNotOwner() public {
        uint256[] memory ids = new uint256[](2);
        uint256[] memory amounts = new uint256[](2);
        vm.prank(user1);
        vm.expectRevert();
        genericERC1155.mintBatch(user2, ids, amounts, "");
    }

    function testBurn() public {
        uint256 tokenId = 1;
        uint256 amount = 100;
        genericERC1155.mint(user1, tokenId, amount, "");

        vm.prank(user1);
        genericERC1155.burn(user1, tokenId, amount);
        assertEq(genericERC1155.balanceOf(user1, tokenId), 0);
    }

    function testBurnBatch() public {
        uint256[] memory ids = new uint256[](2);
        ids[0] = 1;
        ids[1] = 2;
        uint256[] memory amounts = new uint256[](2);
        amounts[0] = 100;
        amounts[1] = 200;
        genericERC1155.mintBatch(user1, ids, amounts, "");

        vm.prank(user1);
        genericERC1155.burnBatch(user1, ids, amounts);
        assertEq(genericERC1155.balanceOf(user1, 1), 0);
        assertEq(genericERC1155.balanceOf(user1, 2), 0);
    }

    function testPause() public {
        genericERC1155.pause();
        assertTrue(genericERC1155.paused());
    }

    function testPauseNotOwner() public {
        vm.prank(user1);
        vm.expectRevert();
        genericERC1155.pause();
    }

    function testUnpause() public {
        genericERC1155.pause();
        genericERC1155.unpause();
        assertFalse(genericERC1155.paused());
    }

    function testUnpauseNotOwner() public {
        genericERC1155.pause();
        vm.prank(user1);
        vm.expectRevert();
        genericERC1155.unpause();
    }

    function testTransferWhenPaused() public {
        uint256 tokenId = 1;
        uint256 amount = 100;
        genericERC1155.mint(user1, tokenId, amount, "");
        genericERC1155.pause();

        vm.prank(user1);
        vm.expectRevert();
        genericERC1155.safeTransferFrom(user1, user2, tokenId, amount, "");
    }

    function testSupply() public {
        uint256 tokenId = 1;
        uint256 amount = 100;
        genericERC1155.mint(user1, tokenId, amount, "");
        assertEq(genericERC1155.totalSupply(tokenId), amount);
    }

    function testExists() public {
        uint256 tokenId = 1;
        assertFalse(genericERC1155.exists(tokenId));
        genericERC1155.mint(user1, tokenId, 1, "");
        assertTrue(genericERC1155.exists(tokenId));
    }
}
