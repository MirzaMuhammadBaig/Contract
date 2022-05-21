// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract LANDregistrationCONTRACT
{
    struct LandRegistry
    {
        address LandID;
        string Area;
        string City;
        string State;
        uint LandPrice;
        uint PropertyPID;
    } 

    mapping(address => LandRegistry) public LandRegistration;

    function LandDetails(address LandregistryNum, address LandID, string memory Area, string memory City, string memory State, uint LandPrice, uint PropertyPID) public
    {
        LandRegistration[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2]= LandRegistry(LandID, Area, City, State, LandPrice, PropertyPID);
    }

    struct BuyerDetails
    {
        string Name;
        uint Age;
        string City;
        string CNIC;
        string Email;
        // string PropertyPID;
        // string BuyerID; //Buyer Id/Key is your account Address (hint :- use mapping to store account address with buyer details)

    }

    mapping(address => BuyerDetails) public BuyerDetail;

    function BUYERdetailes( address BuyerID, string memory Name, uint Age, string memory City, string memory CNIC, string memory Email ) public
    {
        BuyerDetail[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4]= BuyerDetails( Name, Age, City, CNIC, Email);
    }

    struct SellerDetails
    {
        string Name;
        uint Age;
        string City;
        string CNIC;
        string Email;
        // string SellerID;//Buyer and Seller account cannot be same (hint :- use different accounts when add seller details)
    }

    mapping(address => SellerDetails) public SellerDetail;

    function SELLERdetails( address SellerID, string memory Name, uint Age, string memory City, string memory CNIC, string memory Email ) public
    {
        SellerDetail[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2]= SellerDetails( Name, Age, City, CNIC, Email);
    }
