pragma solidity ^0.4.2;
contract DevConAlfaEnergy {

   string public name;
   address public owner;

   //Деньгами управляет только владелец
   modifier onlyOwner { if (msg.sender != owner) throw; _; }

   mapping (address => bool) public isMember;
   mapping (address => uint) public generated;
   mapping (address => uint) public consumed;
   mapping (address => uint) public balance;
   mapping (address => string) public memberName;

   //Событие добавления нового домохозяйства
    event newMember(address member, string name);

   function DevConAlfaEnergy  () {
       name = 'DevCon School Energy Estimate';
       owner = msg.sender;
   }
   
   function addNewMember(address _member, string _name) onlyOwner returns (bool success) {
      //Добавление нового домохозяйства
       isMember[_member]= true;
       memberName[_member]= _name;
       newMember(_member, _name);
       return true;
   }
   
   function declareGenerated(uint _generated)returns (bool success) {
      //Декларируем сколько сгенерировано электроэнергии
       generated[msg.sender] += _generated;
       return true;
   }
   function declareConsumed(uint _consumed)returns (bool success) {
      //Декларируем сколько потреблено электроэнергии
       consumed[msg.sender] += _consumed;
       return true;
   }
   
   function settle(address _consumer) onlyOwner payable returns (bool success) {
      //Фиксация расчётов
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
      //Депонирование средств на смарт-контракт
       if (isMember[msg.sender]){
           if(msg.value >0) {
               balance[msg.sender] += msg.value;
           }
       }
   }
   
   /* This unnamed function is called whenever someone tries to send ether to it */
   function () payable {
       
   }
}