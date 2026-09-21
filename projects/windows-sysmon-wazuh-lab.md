# Windows, Sysmon, and Wazuh Home SOC Lab

A home lab for investigating Windows activity, distinguishing collected events from alerts, and validating narrowly scoped detections.

## Architecture

```text
Physical Windows PC / Hyper-V
├── SOC-WIN11: Windows 11 + Sysmon + Wazuh agent
│   └── Windows event channels → Wazuh agent → TCP 1514
└── SOC-WAZUH: Ubuntu 24.04 LTS
    └── Wazuh server → indexer → browser dashboard
```

SSH provided remote administration and file transfer. Ubuntu firewall rules restricted SSH and dashboard access to the physical host and agent ports to the Windows VM. DHCP changes required checking addresses and updating the agent's manager address. The Windows VM used 4 GB RAM and Ubuntu used 8 GB after troubleshooting host memory pressure.

## Investigations

| Investigation | Status | Evidence and outcome |
|---|---|---|
| [Windows Authentication Investigation — Part 1](windows-authentication-investigation.md) | Complete | Distinguished logon-right denial from an incorrect password, correlated a successful sign-in, and preserved Windows logs. |
| [Missing Sysmon Alert and Custom Detection](wazuh-sysmon-detection-investigation.md) | Complete with documented limitations | Verified a fresh event in raw archives, traced agent-initiated discovery activity, tested a PowerShell-parent rule, and hash-verified exported evidence. |
| [Windows authentication through Wazuh](windows-authentication-through-wazuh.md) | Complete | Correlated account creation and changes with one failed and one successful local login, checked Windows events against Wazuh alerts, and documented a benign true-positive decision. Includes a case note and screenshots. |

## What this lab demonstrates

- Windows process ancestry using ProcessGuid and ParentProcessGuid.
- Linux administration, SSH identity checks, scoped firewall rules, and connectivity troubleshooting.
- Wazuh endpoint enrollment and Sysmon event-channel collection.
- Separating event receipt, decoding, rule matching, and saved alerts.
- Correlating account-management and authentication alerts with their source Windows Security events before deciding whether to close a case.
- Testing a custom detection with matching and nonmatching parent processes.
- Preserving evidence outside the VM and verifying SHA-256 baselines.

## Scope

Completed work consists of controlled lab activities with varying levels of coaching. For the Wazuh authentication case, I performed the test, examined the records, and made the disposition with coaching on setup, searching, and note review. Alerts generated during these tests do not establish an attack. Each investigation documents its own evidence, conclusions, and limitations. Raw event exports and credentials remain private.

[Back to portfolio](../README.md)
