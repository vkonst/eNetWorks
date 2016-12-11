pragma solidity ^0.4.0;

contract ElectricityGenerate {
    /*
    /*  Контракт генератора зелёной электроэнергии
    */
    
    //Адрес генератора
    address owner;
    

    mapping (address => uint256) public el_generated;

    
    function balanceOf(address _add) constant returns (uint256 balance) {
        return el_generated[_add];
    }
    
    function emissionFrom(address _from, uint256 _value) returns (bool success) {
        el_generated[_from] = _value;
        return success;
    }
    
    function approve(address _spender, uint256 _value) returns (bool success) {
        
    }
    
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        
    }

    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
    
    

    /*Функция selfdestruct уничтожает контракт и отправляет все средства со счета контракта на адрес, указанный в аргументе*/
    /*В Ethereum любой участник сети может вызвать любую функцию
    Проверка адреса позволит уничтожить контракт только вам*/
    function kill() { if (msg.sender == owner) selfdestruct(owner); }
}