pragma solidity ^0.4.18;

contract Voting {
    /* mapeo de los votos recibidos por un candidato, siendo el primer par�metro el nombre y el segundo el n�mero de votos */
    mapping (bytes32 => uint8) public votesReceived;
  
    //Lista de candidatos
    bytes32[] public candidateList;

    constructor(bytes32[] candidateNames) public {
        candidateList = candidateNames;
    }

    //Regresa el n�mero total de votos de un candidato
    function totalVotesFor(bytes32 candidate) view public returns (uint8) {
        require(validCandidate(candidate));
        return votesReceived[candidate];
    }

    //Incrementa el n�mero de votos de un candidato en una unidad
    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }

    //funci�n auxiliar que indica si el nombre recibido pertenece a un candidato v�lido.
    function validCandidate(bytes32 candidate) view public returns (bool) {
        for(uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}