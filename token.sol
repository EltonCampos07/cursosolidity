//SPDX-License-Identifier: CC-BY-4.0
// Endereço do contrato = 0x49a62ae9e66Ba2788cf2e345cA7e4B9f7e304770

pragma solidity 0.8.19;

import "contracts/bradesco_token_aberto.sol";

contract Token is ExercicioToken {

    ExercicioToken public contractAddress;

    struct Client{
       address _client;
       uint256 _tokenBalance; 
    }

    mapping (address => Client) public client;

    constructor() {
        contractAddress = ExercicioToken(0x89A2E711b2246B586E51f579676BE2381441A0d0);
    }

    function MeuSaldo() public view returns (uint256) {
        return contractAddress.balanceOf(msg.sender);
    }

    function GerarTokenParaEuCliente(uint256 amount) public onlyOwner {
        require(contractAddress.mint(msg.sender, amount), "Token transfer failed.");
        client[msg.sender]._tokenBalance += amount;
    }

    

}

