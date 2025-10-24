// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract ToDo {
    struct Task {
        uint256 id;
        uint256 date;
        string content;
        bool done;
        uint256 dateComplete;
    }
}
