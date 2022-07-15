// SPDX-License-Identifier: GPL-v3.0

pragma solidity >=0.8.7 <0.9.0;

contract  mclub() {
    mapping(address => string) public memberName;


    struct member {
        address MemberId;
        uint8 rank;
        string nickName;
        enum State { requested, approved, active };
    }



    constructor () public {
        owner = msg.sender; // Only owner can approve members.
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner can call this function!");
        _;
    }

    modifier notOwner() {
        require(owner != msg.sender, "All other than owner can call this function!");
        _;
    }

    modifier

    function



    function MemberRequest(string _nickname) payable notOwner {
        require(!msg.sender == owner, "Owner already member!");
        _;


    }

    function AddAmember() {

    }

    function MemberAddArt() {

    }

    function MemberSellOwnArt() {

    }

    function MemberSellOthersArt() {

    }



}
