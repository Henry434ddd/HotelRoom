pragma solidity ^0.8.0;

contract HotelRoom {


    enum Statuses {Vacant, Occupied}

    Statuses public currentStatus;

    event Occupy(address _occupant, uint _value);

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }


    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Vacant, "Current occupied");
        _;
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount, "not enough of ether provided.");
        _;
    }



    function book() public payable onlyWhileVacant costs(2 ether){
        //check price
        // require(msg.value >= 2 ether, "not enough of ether provided.");
        //check status
        //require(currentStatus == Status.Vacant, "Current occupied");
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
        //(bool sent, bytes memory data)owner.call{value: msg.value}("");
        //require(true);
        emit Occupy(msg.sender,msg.value);
    }














}