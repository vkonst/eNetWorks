pragma solidity ^0.4.2;
contract DevConAlfaEnergy {
   /* Public variables of the token */
   //  uint public generated;
   //  uint public consumpted;
   string public name;
   address public owner;
   modifier onlyOwner { if (msg.sender != owner) throw; _; }
   /* This creates an array with all balances */
   // mapping (address => string) public devProject;
   mapping (address => bool) public isMember;
   mapping (address => uint) public generated;
   mapping (address => uint) public consumed;
   mapping (address => uint) public balance;
   mapping (address => string) public memberName;
   /* This generates a public event on the blockchain that will notify clients */
    event newMember(address member, string name);
   // event rewardPayed(address developer, string project);
   // event newResultGenerated(address consumer, uint generated);
   // event newResultConsumed(address consumer, uint consumed);
   /* Initializes contract */
   function DevConAlfaEnergy  (        ) {
       name = 'DevCon School Energy Estimate';
       owner = msg.sender;
   }
   
   function addNewMember(address _member, string _name) onlyOwner returns (bool success) {
       isMember[_member]= true;
       memberName[_member]= _name;
       newMember(_member, _name);
       return true;
   }
   
   function declareGenerated(uint _generated)returns (bool success) {
       generated[msg.sender] += _generated;
       return true;
   }
   function declareConsumed(uint _consumed)returns (bool success) {
       consumed[msg.sender] += _consumed;
       return true;
   }
   
   function settle(address _consumer) onlyOwner payable returns (bool success) {
       if (generated[_consumer] - consumed[_consumer] > 0){
           if(!msg.sender.send((generated[_consumer] - consumed[_consumer])*100 finney)) throw;
       } else if (balance[_consumer] > 0) {
           balance[_consumer] -= consumed[_consumer] - generated[_consumer];
       } else {
           return false;
       }
       consumed[_consumer] = 0;
       generated[_consumer] = 0;
       return true;
   }
   
   function deposit(uint amount) payable returns (bool success) {
       if (isMember[msg.sender]){
           if(msg.value >0) {
               balance[msg.sender] += msg.value;
           }
       }
   }
   
   // function payReward(string _project) payable returns (bool success) {
   //         if (!rewarded[msg.sender] && devActive[msg.sender]) {
   //         rewarded[msg.sender] = true;
   //         if(!msg.sender.send(100 finney)) throw;
   //         rewardPayed(msg.sender, _project);
   //         return true;
   //         }
       
   // }
   /* This unnamed function is called whenever someone tries to send ether to it */
   function () payable {
       
   }
}