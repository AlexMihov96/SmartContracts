pragma solidity ^0.4.18;

//Hash the strings from here
//https://emn178.github.io/online-tools/sha3_512.html
contract CertificateRegistration {
    address private contractOwner = msg.sender;
    mapping (string => bool) private certificateHashes;

    function addCertificate(string hash) public {
        require(contractOwner == msg.sender);

        certificateHashes[hash] = true;
    }

    function verify(string hash) view public returns (bool) {
        return certificateHashes[hash];
    }
}