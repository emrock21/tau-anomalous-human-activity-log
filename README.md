# Tau Anomalous Human Activity Log

An on-chain log of strange, unsettling, or warp-adjacent phenomena observed by the Tau in human worlds and regiments.  
Users record each anomaly, the suspicion it raises, and the decision taken under Ethereal oversight.  
The community votes whether the case is **contained** or **purged from records**, reflecting the cold logic of the Greater Good.

Fully text-based, permissionless, and designed for creative Warhammer 40K world-building on Base.

---

## Contract

Deployed on Base:  
`0xe963b98e81bab99f8c6aea0dda7863ae538a4dd5`  
https://basescan.org/address/0xe963b98e81bab99f8c6aea0dda7863ae538a4dd5#code

Main file: `contracts/TauAnomalousHumanActivityLog.sol`

---

## How it works

Each anomaly entry stores:

- `world` – Human world or regiment  
- `phenomenon` – Description of the strange event  
- `suspicion` – Why the Tau consider it dangerous or unstable  
- `action` – Decision taken by the Ethereals  
- `remark` – Short contextual note  
- `contained` / `purged` – Community votes  

Entry **0** is a built-in example.

---

## Example

```solidity
recordAnomaly(
  "Auxilia Regiment 12-Crimson",
  "Multiple soldiers exhibited synchronized hallucinations after a warp storm.",
  "High probability of warp contamination spreading through the ranks.",
  "Regiment disbanded and redistributed into isolated labor cadres.",
  "Ethereals declared the unit 'structurally compromised'."
);

Voting:
voteAnomaly(1, true);   // Contained
voteAnomaly(1, false);  // Purged from records

Closing Note
A quiet ledger of human instability through Tau eyes —
a record of fear, control, and calculated silence.
Every anomaly reveals how far the Greater Good will go to protect itself.
