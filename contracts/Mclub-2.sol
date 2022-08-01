// SPDX-License-Identifier: GPL-v3.0

pragma solidity >=0.8.7 <0.9.0;

import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";

contract  mclub is AccessControlEnumerable {
    bytes32 public constant USER_ROLE = keccak256("USER");
    // Define an accepted Member
    bytes32 public constant MEMBER_ROLE = keccak256("MEMBER");
    // Define a preliminary Member
    bytes32 public constant P_MEMBER_ROLE = keccak256("P_MEMBER");

    // When the contract is deployed, the deploying user
    // becomes ADMIN
    constructor () {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setRoleAdmin(USER_ROLE, DEFAULT_ADMIN_ROLE);
    }

/*   enum Member {
        applied,
        accepted,
        denied
    }

    mapping(address => Member) members;
*/
    // Random user requests to be member.
    function MemberRequest() payable public {
        _grantRole(P_MEMBER_ROLE, msg.sender);
        }

    /// Administrator approves the user.
    function ApproveLatestHopeful() public onlyAdmin {
        uint256 latestHopeful;
        address newMember;
        latestHopeful = getRoleMemberCount(P_MEMBER_ROLE);
        newMember = getRoleMember(P_MEMBER_ROLE, latestHopeful);
        _grantRole(MEMBER_ROLE, newMember);
    }

//     function addFunds()

    modifier onlyAdmin() {
        require(isAdmin(msg.sender), "Restricted to admins.");
        _;
    }

    modifier onlyUser() {
        require(isUser(msg.sender), "Restricted to users.");
        _;
    }

   function isAdmin(address account)
        public virtual view returns (bool)
        {
            return hasRole(DEFAULT_ADMIN_ROLE, account);
        }

    function isUser(address account)
        public virtual view returns (bool)
        {
            return hasRole(USER_ROLE, account);
        }

    function addUser(address account)
        public virtual onlyAdmin
        {
            grantRole(USER_ROLE, account);
        }

    function removeUser(address account)
        public virtual onlyAdmin
        {
            revokeRole(USER_ROLE, account);
        }
}
