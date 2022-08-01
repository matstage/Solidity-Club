const { expect } = require("chai");

describe("Mclub contract", function () {
  it("Deployment should assign administration rights to the owner", async function () {
    const [owner] = await ethers.getSigners();

    const mclub = await ethers.getContractFactory("mclub");

    const hardhatMclub= await mclub.deploy();

    const memberRequest = await hardhatMclub.MemberRequest(owner.address);

    const memberApproval = await hardhatMclub.ApproveLatestHopeful();
  });
});
