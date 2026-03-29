// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Tau Anomalous Human Activity Log
/// @notice Record strange or warp-adjacent phenomena observed by the Tau in human worlds or regiments.
/// @dev Simple, safe, text-only contract.

contract TauAnomalousHumanActivityLog {

    struct Anomaly {
        string world;        // Human world or regiment
        string phenomenon;   // Description of the anomaly
        string suspicion;    // Why the Tau consider it dangerous
        string action;       // Action taken by the Ethereals
        string remark;       // Short contextual note
        address creator;     // Who recorded it
        uint256 contained;   // Votes marking it as contained
        uint256 purged;      // Votes marking it as purged from records
        uint256 createdAt;   // Timestamp
    }

    Anomaly[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event AnomalyRecorded(uint256 indexed id, string world, string phenomenon, address indexed creator);
    event AnomalyVoted(uint256 indexed id, bool contained, uint256 containedVotes, uint256 purgedVotes);

    constructor() {
        logs.push(
            Anomaly({
                world: "Example World (Fill your own below)",
                phenomenon: "Describe anomaly",
                suspicion: "Describe suspicion",
                action: "Describe Ethereal decision",
                remark: "Short remark",
                creator: address(0),
                contained: 0,
                purged: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordAnomaly(
        string calldata world,
        string calldata phenomenon,
        string calldata suspicion,
        string calldata action,
        string calldata remark
    ) external {
        require(bytes(world).length > 0, "World required");

        logs.push(
            Anomaly({
                world: world,
                phenomenon: phenomenon,
                suspicion: suspicion,
                action: action,
                remark: remark,
                creator: msg.sender,
                contained: 0,
                purged: 0,
                createdAt: block.timestamp
            })
        );

        emit AnomalyRecorded(logs.length - 1, world, phenomenon, msg.sender);
    }

    function voteAnomaly(uint256 id, bool contained) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Anomaly storage a = logs[id];

        if (contained) {
            a.contained += 1;
        } else {
            a.purged += 1;
        }

        emit AnomalyVoted(id, contained, a.contained, a.purged);
    }

    function totalAnomalies() external view returns (uint256) {
        return logs.length;
    }
}
