pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

import "./Job.sol";

contract EmployeeDetails is Employee {

  function _fillResume() public {
    PersonalInfo memory myPersonalInfo;
    myPersonalInfo.name1 = "Khor Chee Hoong";
    myPersonalInfo.name2 = "Lucas";
    myPersonalInfo.homeAddress = "35,Mandalay Road,#07-37,308215,Singapore";
    myPersonalInfo.contactNumber = "65-96657633";
    myPersonalInfo.email = "chkhor86@gmail.com";
    myPersonalInfo.nationality = "Malaysian";
    myPersonalInfo.residentStatus = "SPR";

    _fillPersonalInfo(myPersonalInfo);
    _fillEmploymentHistory(2012,"Solderfield");
    _fillEmploymentHistory(2009,"Silverlake");
    _fillAcademicHistory(2006,"TARC/Campbell University, Bachelor Degree in Computer Science");
    _setExpectedSalary(6000);

    Resume storage myResume = newResume;
    _createResume(myResume);
  }
}
