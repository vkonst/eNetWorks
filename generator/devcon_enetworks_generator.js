
personal.unlockAccount("0x964d8e455b5e2e2aa392dd444d8ed2cd6b481b72", "12345");

var electricitygenerateContract = web3.eth.contract([{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"}],"name":"approve","outputs":[{"name":"success","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"kill","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"el_generated","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"_add","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_spender","type":"address"}],"name":"allowance","outputs":[{"name":"remaining","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_value","type":"uint256"}],"name":"emissionFrom","outputs":[{"name":"success","type":"bool"}],"payable":false,"type":"function"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_from","type":"address"},{"indexed":true,"name":"_to","type":"address"},{"indexed":false,"name":"_value","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_owner","type":"address"},{"indexed":true,"name":"_spender","type":"address"},{"indexed":false,"name":"_value","type":"uint256"}],"name":"Approval","type":"event"}]);
var electricitygenerate = electricitygenerateContract.new(
   {
     from: "0x964d8e455b5e2e2aa392dd444d8ed2cd6b481b72", 
     data: '0x606060405234610000575b6102c4806100186000396000f360606040523615610070576000357c010000000000000000000000000000000000000000000000000000000090048063095ea7b31461007557806341c0e1b5146100b157806353146750146100c057806370a08231146100f1578063dd62ed3e14610122578063e49441c31461015c575b610000565b34610000576100996004808035906020019091908035906020019091905050610198565b60405180821515815260200191505060405180910390f35b34610000576100be6101a1565b005b34610000576100db6004808035906020019091905050610235565b6040518082815260200191505060405180910390f35b346100005761010c600480803590602001909190505061024d565b6040518082815260200191505060405180910390f35b34610000576101466004808035906020019091908035906020019091905050610281565b6040518082815260200191505060405180910390f35b3461000057610180600480803590602001909190803590602001909190505061028a565b60405180821515815260200191505060405180910390f35b60005b92915050565b600060009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16141561023257600060009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16ff5b5b565b60016020528060005260406000206000915090505481565b6000600160008373ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205490505b919050565b60005b92915050565b600081600160008573ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508090505b9291505056', 
     gas: '4700000'
   }, function (e, contract){
    console.log(e, contract);
    if (typeof contract.address !== 'undefined') {
         console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);
    }
 })

//Ждём пока сгенерится контракт

var concon = web3.eth.contract(abi).at("адрес_контракта");


//Выполняем транзакцию
personal.unlockAccount("0x964d8e455b5e2e2aa392dd444d8ed2cd6b481b72", "12345");
concon.emissionFrom.sendTransaction("0x964d8e455b5e2e2aa392dd444d8ed2cd6b481b72", 1000, {from:"0x964d8e455b5e2e2aa392dd444d8ed2cd6b481b72"})

//Смотрим что там
concon.balanceOf("0x964d8e455b5e2e2aa392dd444d8ed2cd6b481b72")