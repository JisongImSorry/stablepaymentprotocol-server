//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Useful for debugging. Remove when deploying to a live network.

// Use openzeppelin to inherit battle-tested implementations (ERC20, ERC721, etc)
// import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * A smart contract that allows changing a state variable of the contract and tracking the changes
 * It also allows the owner to withdraw the Ether in the contract
 * @author BuidlGuidl
 */


contract YourContract {
	// State Variables
	address public immutable owner;

	uint public deployDate;
	uint256 public price = 0;
	uint public transactionState;
	uint public seed;

	string public transactionHash;
	address public from;
	address public to;

	// Constructor: Called once on contract deployment
	// Check packages/hardhat/deploy/00_deploy_your_contract.ts
	constructor(address _owner, uint _rnd) {
		owner = _owner;
		seed = _rnd;
		deployDate = block.timestamp;
		transactionState = 0;
	}

	function initPayment (string memory txHash, address _from, address _to ) public {
		transactionHash = txHash;
		from = _from;
		to = _to;
	}
}
