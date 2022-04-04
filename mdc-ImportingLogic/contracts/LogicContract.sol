// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract LogicContract{

    /********* Storage variable  - Start************/ 
    //Map of valid reviewers
    mapping (address => bool) public isReviewer;

    /********* Storage variable  - End************/

    /********* Modifiers - Start************/ 
    //Check if the reveiwer exists in the reviewer mapping
    modifier reviewerExists(address _reviewer){
        require(isReviewer[_reviewer], "The mentioned reviewer does not exist");
        _;
    }
    //Check if the reveiwer exists in the reviewer mapping
    modifier reviewerDoesNotExists(address _reviewer) {
        require(!isReviewer[_reviewer]);
        _;
    }
    /********* Modifiers - End************/ 

    //Add reviewer - Can be performed only by the owner of the master document contract
    function _addReviewer(address _reviewer) external reviewerDoesNotExists(_reviewer){
       isReviewer[_reviewer] = true;
    }
    //Remove a reviewer - Can be performed only by the owner of the master document contract
    function _removeReviewer(address _reviewer) external reviewerExists(_reviewer){
        isReviewer[_reviewer] = false;
    }

    function _isValidReviewer(address _reviewerAddress) external view returns(bool validReviewer){
        return isReviewer[_reviewerAddress];
    }

    
}