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
    event TaskCreated(uint256 id, uint256 date, string content, bool done);

    event TaskStatusToggled(uint256 id, bool done, uint256 dateComplete);

    event TaskDeleted(uint256 id);

    // Task[] tasks;
    // this consume gas when loop through entries in getTask
    // so list should be avoided

    mapping(uint256 => Task) private tasks;

    // mapping default uint value is 0 when key missing
    // therefore avoid initialize with default value
    // (otherwise modifier taskExists will not work)
    uint256 private lastTaskId = 1;
    uint256[] private taskIds;

    function createTask(string memory _content) public {
        uint256 theNow = block.timestamp;

        tasks[lastTaskId] = Task(lastTaskId, theNow, _content, false, 0);
        taskIds.push(lastTaskId);

        emit TaskCreated(lastTaskId, theNow, _content, false);
        lastTaskId++;
    }

    function getTask(
        uint256 id
    )
        public
        view
        taskExists(id)
        returns (uint256, uint256, string memory, bool, uint256)
    {
        return (
            id,
            tasks[id].date,
            tasks[id].content,
            tasks[id].done,
            tasks[id].dateComplete
        );
    }

    // return dummy data for test
}
