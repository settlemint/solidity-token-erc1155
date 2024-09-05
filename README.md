<p align="center">
  <img src="https://github.com/settlemint/solidity-token-erc1155/blob/main/OG_Solidity.jpg" align="center" alt="logo" />
  <p align="center">
    ✨ <a href="https://settlemint.com">https://settlemint.com</a> ✨
    <br/>
    Build your own blockchain usecase with ease.
  </p>
</p>
<br/>
<p align="center">
<a href="https://github.com/settlemint/solidity-token-erc1155/actions?query=branch%3Amain"><img src="https://github.com/settlemint/solidity-token-erc1155/actions/workflows/solidity.yml/badge.svg?event=push&branch=main" alt="CI status" /></a>
<a href="https://fsl.software" rel="nofollow"><img src="https://img.shields.io/npm/l/@settlemint/solidity-token-erc1155" alt="License"></a>
<a href="https://www.npmjs.com/package/@settlemint/solidity-token-erc1155" rel="nofollow"><img src="https://img.shields.io/npm/dw/@settlemint/solidity-token-erc1155" alt="npm"></a>
<a href="https://github.com/settlemint/solidity-token-erc1155" rel="nofollow"><img src="https://img.shields.io/github/stars/settlemint/solidity-token-erc1155" alt="stars"></a>
</p>

<div align="center">
  <a href="https://console.settlemint.com/documentation/">Documentation</a>
  <span>&nbsp;&nbsp;•&nbsp;&nbsp;</span>
  <a href="https://discord.com/invite/Mt5yqFrey9">Discord</a>
  <span>&nbsp;&nbsp;•&nbsp;&nbsp;</span>
  <a href="https://www.npmjs.com/package/@settlemint/solidity-token-erc1155">NPM</a>
  <span>&nbsp;&nbsp;•&nbsp;&nbsp;</span>
  <a href="https://github.com/settlemint/solidity-token-erc1155/issues">Issues</a>
  <br />
</div>

## Get Started

This repository provides a generic ERC1155 token contract with functionalities like minting, burning, pausing, and supply tracking. You can either:

- **Launch this smart contract set directly in SettleMint**: Under the `Smart Contract Sets` section. This will automatically link the contract to your blockchain node and use the private keys stored in the platform.
  
  For detailed instructions on deploying smart contracts using SettleMint, refer to this [deployment guide](https://console.settlemint.com/documentation/docs/using-platform/add_smart_contract_sets/deploying_a_contract/).

- **Integrate it into your own project**:
  - Bootstrap a new project using Forge:
    ```shell
    forge init my-project --template settlemint/solidity-token-erc1155
    ```
  - Or, add it as a dependency to your existing project using npm:
    ```shell
    npm install @settlemint/solidity-token-erc1155
    ```

### Deploy Contracts & Run Tasks in your Integrated IDE

Using SettleMint’s Integrated IDE, you can easily run tasks like compiling, testing, and deploying your contracts. Here’s how to get started:

1. Open the Tasks panel by pressing `Cmd + Shift + P` (Mac) or `Ctrl + Shift + P` (Windows/Linux) or by selecting it from the left menu.
2. Select the desired task from the list. Available tasks include:

   - **Foundry - Compile**: Compiles the Foundry contracts.
   - **Hardhat - Compile**: Compiles the Hardhat contracts.
   - **Foundry - Test**: Runs tests using Foundry.
   - **Hardhat - Test**: Runs tests using Hardhat.
   - **Foundry - Start Network**: Starts a local Ethereum network using Foundry.
   - **Hardhat - Start Network**: Starts a local Ethereum network using Hardhat.
   - **Hardhat - Deploy to Local Network**: Deploys contracts to a local network.
   - **Hardhat - Deploy to Platform Network**: Deploys contracts to the specified platform network.
   - **The Graph - Build & Deploy**: Builds and deploys the subgraph.

Alternatively, you can use the IDE terminal to deploy your contract using common commands from [Hardhat](https://hardhat.org/ignition/docs/guides/deploy) or [Foundry](https://book.getfoundry.sh/forge/deploying).

### Learn More about Foundry and Hardhat

To fully leverage the capabilities of Foundry and Hardhat, you can explore our comprehensive documentation [here](https://console.settlemint.com/documentation/docs/using-platform/add_smart_contract_sets/smart_contracts/).

## ERC1155 Contract Features

This repository includes a customizable ERC1155 token contract with the following features, powered by OpenZeppelin’s secure libraries:

- **Mintable**: The contract owner can create new tokens, either individually or in batches.
- **Burnable**: Token holders can permanently destroy their tokens.
- **Pausable**: The contract owner can pause and resume all token transfers.
- **Supply Tracking**: Keeps track of the total supply for each token ID.

### Key Functions

- **`pause()` / `unpause()`**: Pauses or resumes all token transfers.
- **`mint(address account, uint256 id, uint256 amount, bytes memory data)`**: Mints a specified amount of a single token type to a given address.
- **`mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)`**: Mints multiple token types in a single transaction.
- **`burn(address account, uint256 id, uint256 amount)`**: Burns a specified amount of a single token type from a given address.
- **`burnBatch(address account, uint256[] memory ids, uint256[] memory amounts)`**: Burns multiple token types from a given address in a single transaction.

### OpenZeppelin Libraries Utilized

This contract is built using the following OpenZeppelin libraries to ensure robust and secure functionality:

- **ERC1155**: A standard interface for multi-token contracts.
- **ERC1155Burnable**: Adds burn functionality to the ERC1155 tokens.
- **ERC1155Pausable**: Allows the contract owner to pause and resume token transfers.
- **ERC1155Supply**: Tracks the total supply of each token type.
- **Ownable**: Provides a simple access control mechanism for the contract owner.
