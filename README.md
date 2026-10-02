# Ben Pham | Cybersecurity Portfolio

Home-lab investigations, coursework, and personal projects focused on security alerts, endpoint logs, phishing, and network traffic.

## About me

I’m a cybersecurity student in Tampa, Florida, preparing for IT support, cybersecurity internship, and entry-level SOC opportunities. I’m completing the University of Florida’s 18-week Certified Cybersecurity Associate Program while pursuing a B.S. in Exercise Science at the University of South Florida.

These write-ups show what I checked, the evidence I used, the decision I reached, and what remains uncertain. Lab tests are identified as lab tests; they are not workplace incidents.

## Start here

### [Windows authentication through Wazuh](projects/windows-authentication-through-wazuh.md)

Investigated a controlled account-creation and login sequence. I checked five Wazuh alerts against Windows Security events, built a UTC timeline, and documented a benign true-positive decision supported by the authorized test activity.

**Tools:** Wazuh, Windows Security logs  
**Evidence:** Redacted screenshots and a [concise SOC case note](projects/windows-authentication-through-wazuh-case-note.md)

### [Investigating a missing Sysmon alert and testing a Wazuh detection](projects/wazuh-sysmon-detection-investigation.md)

Verified that a fresh process event reached Wazuh even though the alert search did not show a corresponding Windows alert. I tested a scoped rule that produced two intended positive alerts and documented the limits of the negative comparison.

**Tools:** Sysmon, Wazuh, PowerShell  
**Evidence:** Rule logic, test results, screenshots, and SHA-256 checks of exported files

### [Personal-mailbox phishing investigation](projects/personal-mailbox-phishing-investigation.md)

Reviewed a suspicious billing warning from my own mailbox. I examined headers and button destinations, classified and reported the message as phishing, and explained why the email alone did not establish account or device compromise.

**Tools:** Gmail, raw email headers and HTML  
**Evidence:** Annotated screenshots, observations, and a case note

### [Microsoft Sentinel: authorized Azure tag changes](projects/sentinel-tag-change-investigation.md)

Used KQL to investigate controlled Azure tag changes. I compared timestamps and correlation IDs, traced alerts back to source events, and confirmed a benign incident disposition. The write-up separates verified results from unresolved duplicate-alert behavior.

**Tools:** Microsoft Sentinel, AzureActivity, KQL  
**Evidence:** Query logic, a transcribed timeline, and validation limits

## Current investigation — Malware analysis (LokiBot)

**Status: In progress. Updated October 2, 2026.**

- Reviewed the purchase-order email and archive context and verified the executable’s SHA-256 against the source reference.
- Imported the executable into Ghidra and examined its entry point, imports, and strings. A Visual Basic runtime reference is a static lead, not proof of runtime behavior.
- Launched the sample in a network-disconnected Windows VM and saved Process Monitor PML and Sysmon EVTX files. The launch and nonzero evidence-file sizes were verified.
- **Next question:** Did the first-run process start child processes? I will check the saved recordings before making behavioral claims.

Runtime findings, sample-specific YARA/Sigma rules, collected-evidence analysis through Wazuh, and the final case report remain pending. Capture coverage and saved-event contents still need review.

## More investigations and projects

### Endpoint monitoring and authentication

- [Windows, Sysmon, and Wazuh home SOC lab](projects/windows-sysmon-wazuh-lab.md) — Environment overview linking the collection, detection, and authentication investigations.
- [Windows authentication investigation — Part 1](projects/windows-authentication-investigation.md) — Distinguished a missing remote-logon right from an incorrect password and preserved a three-event UTC timeline.
- [macOS authentication log investigation](projects/macos-authentication-log-investigation.md) — Reviewed a controlled sudo event, preserved evidence, and documented logging limits.
- [macOS threat hunting with osquery](projects/macos-osquery-threat-hunting.md) — Reviewed processes, listening ports, launchd entries, and browser extensions; investigated unfamiliar software and verified remediation.

### Email, network traffic, and file triage

- [Phishing email analysis — BTLO](projects/btlo-phishing-email-analysis.md) — Training investigation of message layers, delivery headers, reverse DNS, and a phishing lure.
- [Wireshark TCP SYN scan investigation](projects/wireshark-tcp-syn-scan-investigation.md) — Identified scanning activity in a supplied capture and distinguished a SYN scan exchange from a completed handshake.
- [Wireshark protocol security analysis](projects/wireshark-protocol-security-analysis.md) — Compared plaintext and encrypted protocols and examined credential exposure.
- [YARA file detection and rule tuning](projects/yara-file-detection-rule-tuning.md) — Tested rules on harmless text samples, compared thresholds, investigated a false positive, and corrected scan scope.
- [VirusTotal file triage](projects/virustotal-malware-analysis.md) — Reviewed vendor detections and file metadata associated with Mimikatz and assessed potential credential-theft risk. This was file triage, not evidence of credential theft on a host.

### IT and security fundamentals

- [Linux command-line and log analysis](projects/linux-command-line-and-log-analysis.md) — Used filtering and pipelines to search logs and extract information.
- [Windows user, group, and file management](projects/windows-user-group-file-management.md) — Practiced local account administration, group membership, and file attributes through PowerShell.
- [Home network security assessment](projects/home-network-security-assessment.md) — Reviewed common network and device risks and documented security recommendations.

## Tools and skills demonstrated

- **Security monitoring:** Wazuh, Sysmon, Windows Security logs, Microsoft Sentinel, KQL
- **Investigation:** Alert-to-event correlation, UTC timelines, email-header review, Wireshark packet analysis
- **Detection and triage:** Scoped Wazuh rules, YARA testing on harmless samples, VirusTotal, SHA-256 verification
- **Systems:** PowerShell, Linux command line, macOS/osquery, local accounts and permissions, virtual machines
- **Documentation:** Evidence-based case notes, redacted screenshots, test results, and clear limitations

Ghidra and Process Monitor are part of the current malware investigation; that project’s runtime conclusions are still pending.

## How I approach a case

Start with a question, check the source evidence, consider an ordinary explanation, and document why I would close the case or continue investigating. An alert name is a starting point; the evidence and context determine the decision.
