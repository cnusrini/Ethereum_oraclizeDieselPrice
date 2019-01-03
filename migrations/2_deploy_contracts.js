var oraclizeDieselPrice = artifacts.require("./oraclizeDieselPrice.sol");

module.exports = function(deployer) {
    deployer.deploy(oraclizeDieselPrice);
};
