// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract LandRegistration
{
    struct RegistrationLand
    {
        string Area;
        string City;
        string State;
        uint LandPrice;
        uint PropertyPID;
        address Owner;
    } 

    struct BuyerDetail
    {
        string Name;
        uint Age;
        string City;
        string CNIC;
        string Email;
    }

    struct SellerDetail
    {
        string Name;
        uint Age;
        string City;
        string CNIC;
        string Email;
    }

    struct LandInspectorDetail
    {
        address ID;
        string Name;
        uint Age;
        string Designation;
    }

    //mappings

    mapping(uint => RegistrationLand) public LandDetails;
    mapping(address => BuyerDetail) public BuyerDetails;
    mapping(address => SellerDetail) public SellerDetails;
    mapping(address => LandInspectorDetail) public LandInspectorDetails;
    mapping(address => bool) public IsBuyerVerify;
    mapping(address => bool) public IsSellerVerify;
    mapping(uint => bool) public IsLandVerify;
    mapping(address => bool) public IsLandInspectorVerify;


    // function of register seller

    function RegisterSeller(address , string memory NAME, uint AGE, string memory CITY, string memory CNIC, string memory Email) public
    {
        SellerDetails[msg.sender] = SellerDetail( NAME, AGE, CITY, CNIC, Email);

        require(IsSellerVerify[msg.sender] == true,"please verify seller");
    }

    //function of verify seller

    function VerifySeller(address add) public
    {
        IsSellerVerify[add] = true;
    }

    //function of reject seller

    function RejectSeller(address add ) public
    {
        IsSellerVerify[add] = false;
    }

    //function of register buyer

    function RegisterBuyer(address addr, string memory NAME, uint AGE, string memory CITY, string memory CNIC, string memory Email) public
    {
        BuyerDetails[addr] = BuyerDetail( NAME, AGE, CITY, CNIC, Email);

        require(IsBuyerVerify[msg.sender] == true,"please verify buyer");
    }

    //function of verify buyer

    function VerifyBuyer(address addr) public
    {
        IsBuyerVerify[addr] = true;
    }

    //function of reject buyer

    function RejectBuyer(address addr) public
    {
        IsBuyerVerify[addr] = false;
    }

    //function of land registration

    function RegisterLand(uint _LandID, string memory Area, string memory City, string memory State, uint LandPrice, uint PropertyPID, address) public
    {
        LandDetails[_LandID] = RegistrationLand( Area, City, State, LandPrice, PropertyPID, msg.sender);

        require(IsLandVerify[_LandID] == true,"please verify Land");
    }

    //function of land verify

    function VerifyLand(uint _LandID) public
    {
        IsLandVerify[_LandID] = true;
    }

    //function of reject land

    function RejectLand(uint _LandID) public
    {
        IsLandVerify[_LandID] = false;
    }

    // seller update

    function UpdateSeller(address addr, string memory Name_, uint Age_, string memory City_, string memory CNIC_, string memory Email_) public
    {
        SellerDetails[addr].Name=Name_;
        SellerDetails[addr].Age=Age_;
        SellerDetails[addr].City=City_;
        SellerDetails[addr].CNIC=CNIC_;
        SellerDetails[addr].Email=Email_;
    }

    // buyer update

    function UpdateBuyer(address addr, string memory Name_, uint Age_, string memory City_, string memory CNIC_, string memory Email_) public
    {
        BuyerDetails[addr].Name=Name_;
        BuyerDetails[addr].Age=Age_;
        BuyerDetails[addr].City=City_;
        BuyerDetails[addr].CNIC=CNIC_;
        BuyerDetails[addr].Email=Email_;
    }

    // get land details by landID

    function GetLandDetails(uint ID) public view returns (string memory, string memory, string memory, uint, uint)
    {
        return  
            ( LandDetails[ID].Area,
            LandDetails[ID].City,
            LandDetails[ID].State,
            LandDetails[ID].LandPrice,
            LandDetails[ID].PropertyPID );
    }

    // check owner by landID

    function GetLandOwner(uint _LandID) public view returns(address)
    {
        return LandDetails[_LandID].Owner;
    } 

    // get city by landID

    function GetLandCity(uint ID) public view returns (string memory)
    {
        return(LandDetails[ID].City);
    }

    // get land price by landID

    function GetLandPrice(uint ID) public view returns (uint)
    {
        return(LandDetails[ID].LandPrice);
    }

    // get area by landID

    function GetLandArea(uint ID) public view returns (string memory)
    {
        return(LandDetails[ID].Area);
    }

    // function of register land inspector 

        function RegisterLandInspector(address ID, string memory NAME, uint AGE, string memory Designation) public
    {
        LandInspectorDetails[msg.sender] = LandInspectorDetail(ID, NAME, AGE, Designation);

        require(IsLandInspectorVerify[msg.sender] == true,"please verify landinspector");
    }

    //function of verify land inspector

    function VerifyLandInspector(address addr) public
    {
        IsLandInspectorVerify[addr] = true;
    }

    //function of reject land inspector

    function RejectLandInspector(address addr ) public
    {
       IsLandInspectorVerify[addr] = false;
    }

    // buy land

    function BuyLand(uint _LandID) public payable
    {
        require(IsBuyerVerify[msg.sender] == true,"please verify buyer");
        require(IsLandVerify[_LandID] == true,"please verify buyer");
        payable(LandDetails[_LandID].Owner).transfer(msg.value);
        LandDetails[_LandID].Owner = msg.sender;
    }

    //transfer land

    function TransferLandOwnerShip(uint _LandID, address newOwner) public
    {
        LandDetails[_LandID].Owner = newOwner;
    }
}


