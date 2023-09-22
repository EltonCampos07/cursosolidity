//SPDX-License-Identifier: CC-BY-4.0
// Endereço do contrato = 0x49a62ae9e66Ba2788cf2e345cA7e4B9f7e304770
// Endereço do contrato (teste 2) = 0x6E8cc72F85cc0C899AC180Fd66c1f35D61e1b9bA

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

    function saldoNativo() public view returns(uint256) {
        return address(this).balance;
    }

    function tranferEther(uint256 _amount, address payable receiver) public payable {
        require(_amount <= address(this).balance, "Saldo insuficiente");
        receiver.transfer(_amount);
    }

}