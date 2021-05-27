pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

contract DateTime {
  function getYear(uint timestamp) public view returns (uint16);
  function getMonth(uint timestamp) public view returns (uint8);
  function getDay(uint timestamp) public view returns (uint8);
}

contract Employee {
  address public dateTimeAddr = 0x8Fc065565E3e44aef229F1D06aac009D6A524e82;
  DateTime dateTime = DateTime(dateTimeAddr);

  mapping (string => address) UserToOwner;
  mapping (string => Resume) UserToResume;

  struct Resume {
    PersonalInfo personalInfo;
    mapping (uint16 => string) employmentHistory;
    mapping (uint16 => string) academicHistory;
    uint16 expectedSalary;
  }

  struct PersonalInfo {
    string userId;
    string name1;
    string name2;
    string homeAddress;
    string contactNumber;
    string email;
    string nationality;
    string residentStatus;
  }

  Resume newResume;

  function _fillPersonalInfo(PersonalInfo memory _personalInfo) public {
    newResume.personalInfo.name1 = _personalInfo.name1;
    newResume.personalInfo.name2 = _personalInfo.name2;
    newResume.personalInfo.homeAddress = _personalInfo.homeAddress;
    newResume.personalInfo.contactNumber = _personalInfo.contactNumber;
    newResume.personalInfo.email = _personalInfo.email;
    newResume.personalInfo.userId = _personalInfo.email;
    newResume.personalInfo.nationality = _personalInfo.nationality;
    newResume.personalInfo.residentStatus = _personalInfo.residentStatus;
  }

  function _fillEmploymentHistory(uint16 _startYear, string memory _employer) public {
    newResume.employmentHistory[_startYear] = _employer;
  }

  function _fillAcademicHistory(uint16 _startYear, string memory _academic) public {
    newResume.academicHistory[_startYear] = _academic;
  }

  function _setExpectedSalary(uint16 _expectedSalary) public {
    newResume.expectedSalary = _expectedSalary;
  }

  function _createResume(Resume memory _resume) internal {
    UserToResume[_resume.personalInfo.userId] = _resume;
    UserToOwner[_resume.personalInfo.userId] = msg.sender;
  }

  function _updateHomeAddress(string memory _userId, string memory _newHomeAddress) public {
    require(msg.sender == UserToOwner[_userId]);
    Resume storage myResume = UserToResume[_userId];
    myResume.personalInfo.homeAddress = _newHomeAddress;
  }

  function _updateContactNumber(string memory _userId, string memory _newContactNumber) public {
    require(msg.sender == UserToOwner[_userId]);
    Resume storage myResume = UserToResume[_userId];
    myResume.personalInfo.contactNumber = _newContactNumber;
  }

  function _jobOffer(string memory _userId, string memory _employer, uint16 _monthlyAllowance) public returns(bool){
    Resume storage offerResume = UserToResume[_userId];

    if (offerResume.expectedSalary <= _monthlyAllowance) {
      _fillEmploymentHistory(dateTime.getYear(now), _employer);
      return true;
    } else {
      return false;
    }
  }
}
