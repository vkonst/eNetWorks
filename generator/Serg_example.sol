pragma solidity ^0.4.2;

contract DevConSchoolReward {

    /* Public variables of the token */

    string public name;

    address public owner;

    modifier onlyOwner { if (msg.sender != owner) throw; _; }

    /* This creates an array with all balances */

    mapping (address => string) public devProject;

    mapping (address => bool) public devActive;

    mapping (address => bool) public rewarded;

    /* This generates a public event on the blockchain that will notify clients */

    event newDev(address developer, string project);

    event rewardPayed(address developer, string project);

    /* Initializes contract */

    function DevConSchoolReward  (        ) {

        name = 'DevCon School Blockchain Reward';

        owner = msg.sender;

    }

    /*  */

    function newDeveloper(address _developer, string _project) onlyOwner returns (bool success) {

        devProject[_developer]= _project;

        devActive[_developer] = true;

        newDev(_developer, _project);

        return true;

    }

    

    function payReward(string _project) payable returns (bool success) {

            if (!rewarded[msg.sender] && devActive[msg.sender]) {

            rewarded[msg.sender] = true;

            if(!msg.sender.send(100 finney)) throw;

            rewardPayed(msg.sender, _project);

            return true;

            }

        

    }

    /* This unnamed function is called whenever someone tries to send ether to it */

    function () payable {

        

    }

}