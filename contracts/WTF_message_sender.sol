//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ContractA {
    uint256 number;

    function store(uint256 _number) public {
        number = _number;
    }

    function retrieve() public view returns (uint256) {
        return number;
    }

    function inspectSender() public view returns (address) {
        return msg.sender; // address2
    }

    function inspectOrigin() public view returns (address) {
        return tx.origin; // address1
    }

    constructor() public {}
}

contract ContractB {
    ContractA contractAObject;

    constructor() public {
        contractAObject = new ContractA();
    }

    function inspectInspectSender() public view returns (address) {
        return contractAObject.inspectSender(); //
    }

    function inspectInspectOrigin() public view returns (address) {
        return contractAObject.inspectOrigin(); // address1
    }

    function inspectSender() public view returns (address) {
        return msg.sender; // address1
    }

    function inspectOrigin() public view returns (address) {
        return tx.origin;
    }
}
