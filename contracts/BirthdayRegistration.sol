// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

contract BirthdayRegistration{
    struct _record{
        address user;
        string nameOfChild;
        string fatherName;
        string motherName;
        string residenceAddress;
        uint256 timeOfRegistration;
        uint256 DateOfBirth;
    }
    uint256 recordNumber=1;
    mapping(uint256=>_record) public keepRecord;

    function Registration(string memory _nameOfChild,string memory _fatherName,
    string memory _motherName,string memory _residenceAddress, uint _DateOfBirth) public returns(string memory,uint) {
        keepRecord[recordNumber].user=msg.sender;
        keepRecord[recordNumber].nameOfChild=_nameOfChild;
        keepRecord[recordNumber].fatherName=_fatherName;
        keepRecord[recordNumber].motherName=_motherName;
        keepRecord[recordNumber].residenceAddress=_residenceAddress;
        keepRecord[recordNumber].timeOfRegistration=block.timestamp;
        keepRecord[recordNumber].DateOfBirth=_DateOfBirth; //In seconds
        recordNumber++;
        return("your record number is",recordNumber);

    }

    function getAgeinDays(uint _recordNumber) public view returns(uint){ //will returns age in days only
        uint startDate=keepRecord[_recordNumber].DateOfBirth;
        uint dateNow= block.timestamp;
        uint _days= (dateNow - startDate)/86400;
        return(_days);
    }

    
}