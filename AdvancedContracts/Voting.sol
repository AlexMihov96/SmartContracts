pragma solidity ^0.4.17;

contract VotingSystem {
    mapping(bytes32=> uint32) public votesForCandidates;
    bytes32[] private candidates;

    function addCandidate(bytes32 candidate) public {
        candidates.push(candidate);
    }

    function validCandidate(bytes32 candidate) public view returns (bool) {
        for (var i = 0; i < candidates.length; i++) {
            if (candidates[i] == candidate) {           
                return true;
            } else {
                return false;
            }
        }
    }

    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesForCandidates[candidate] += 1;
    }

    function totalVotesFor(bytes32 candidate) public view returns (uint) {
        require(validCandidate(candidate));
        return votesForCandidates[candidate];
    }
}