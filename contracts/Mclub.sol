// SPDX-License-Identifier: GPL-v3.0

pragma solidity >=0.8.7 <0.9.0;

contract  mclub() {
    mapping(address => member) public ClubMembers;

    function MemberRequest(string _nickname) storage payable notOwner {
           // require(!msg.sender == owner, "Owner already member!");
        ClubMembers[msg.sender] = { nickName: _nickname  };
    }


    struct member {
        address MemberId;
        uint8 rank;
        string nickName;
        enum State { requested, approved, active };
    }

    constructor () public {
        owner = msg.sender; // Whoever Deploys becomes the owner.
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner can call this function!");
        _;
    }

    modifier notOwner() {
        require(owner != msg.sender, "All other than owner can call this function!");
        _;
    }

    function ApproveAmember(address _newMember) public onlyOwner {
        ClubMembers[_newMember].State = approved;


    }

    function MemberAddArt() {

    }

    function MemberSellOwnArt() {

    }

    function MemberSellOthersArt() {

    }



}
