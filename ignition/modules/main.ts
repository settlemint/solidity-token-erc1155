import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const GenericERC1155Module = buildModule("GenericERC1155Module", (m) => {
  const erc1155 = m.contract("GenericERC1155");

  return { erc1155 };
});

export default GenericERC1155Module;
