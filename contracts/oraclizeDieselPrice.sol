pragma solidity ^0.5.0;
//import "https://github.com/oraclize/ethereum-api/blob/master/oraclizeAPI_0.5.sol";
import "./oraclizeAPI.sol";

contract oraclizeDieselPrice is usingOraclize{

  uint public dieselPriceInUSD;
  event LogUpdatedDieselPrice(string price);
  event LogUpdatedOraclizeQuery(string description);


  constructor() public {
  update(); // First check at contract creation...
  }

  function __callback(bytes32 myid, string memory result) public {
      require(msg.sender == oraclize_cbAddress());
      emit LogUpdatedDieselPrice(result);
      dieselPriceInUSD = parseInt(result, 2); // Let's save it as cents...
      // Now do something with the USD Diesel price...
  }

  function update() public payable {
      emit LogUpdatedOraclizeQuery("Oraclize query was sent, standing by for the answer...");
      oraclize_query("URL", "xml(https://www.fueleconomy.gov/ws/rest/fuelprices).fuelPrices.diesel");
  }

}
