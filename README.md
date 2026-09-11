# Benjamin Pham | Cybersecurity Portfolio

Hands-on cybersecurity labs and projects covering endpoint threat hunting, Linux, Windows, networking, malware analysis, and cloud security.

## About Me

I am a University of South Florida student pursuing a B.S. in Exercise Science while completing the University of Florida's 18-week Certified Cybersecurity Associate Program. I am building practical IT and cybersecurity experience while preparing for entry-level IT support, cybersecurity internship, and SOC analyst opportunities.

Through hands-on labs, I have investigated macOS endpoint activity with osquery, created and tuned YARA detection rules, analyzed suspicious files with VirusTotal, examined network traffic with Wireshark, and practiced Windows and Linux administration, access control, home-network hardening, virtualization, and cloud-security fundamentals.

Each project documents the objective, tools, methodology, evidence, findings, remediation recommendations, and lessons learned.

## Technical Skills

- Linux and Windows command-line administration
- macOS threat hunting with osquery
- YARA rule development and false-positive tuning
- Networking and common protocols
- Wireshark packet analysis
- VirusTotal malware investigation
- User, group, and permission management
- Virtual machines and cloud fundamentals
- AWS EC2 and security concepts
- Technical troubleshooting and documentation

## Projects

### [YARA File Detection and Rule Tuning](projects/yara-file-detection-rule-tuning.md)

Created and tested YARA rules against harmless training files, compared detection sensitivity, analyzed a false positive, and corrected scan scope to prevent rules from matching their own source files.
### [macOS Authentication Log Investigation](projects/macos-authentication-log-investigation.md)

Investigated a controlled sudo authentication event using macOS Unified Log, identified the account and timeline, preserved evidence with SHA-256 integrity verification, documented visibility limitations, and made an evidence-based close-versus-escalate decision.

### [Wireshark TCP SYN Scan Investigation](projects/wireshark-tcp-syn-scan-investigation.md)

Completed a guided training-capture investigation to identify a scanner and target, establish a UTC timeline, examine destination ports, and distinguish a SYN → SYN/ACK → RST exchange from a completed TCP handshake.

### [macOS Threat Hunting with osquery](projects/macos-osquery-threat-hunting.md)

Used osquery and native macOS utilities to baseline an Apple Silicon Mac, correlate processes with listening ports, investigate launchd persistence, validate an unfamiliar executable, review browser extensions, remediate unwanted software, and verify the results.

### [VirusTotal Malware Analysis](https://github.com/Benpham3466-cyb/cybersecurity-portfolio/blob/main/projects/virustotal-malware-analysis.md)

Analyzed a suspicious file using VirusTotal, identified Mimikatz-related activity, assessed credential-theft risk, and documented recommended incident-response actions.

### [Linux Command-Line and Log Analysis](https://github.com/Benpham3466-cyb/cybersecurity-portfolio/blob/main/projects/linux-command-line-and-log-analysis.md)

Used Linux navigation, file-management, filtering, and pipeline commands to search logs, extract information, and analyze system data.

### [Windows User, Group, and File Management](https://github.com/Benpham3466-cyb/cybersecurity-portfolio/blob/main/projects/windows-user-group-file-management.md)

Managed Windows users, local groups, passwords, group membership, and hidden-file attributes through PowerShell while applying least-privilege principles.

### [Home Network Security Assessment](https://github.com/Benpham3466-cyb/cybersecurity-portfolio/blob/main/projects/home-network-security-assessment.md)

Evaluated common router, Wi-Fi, device, access-control, and recovery risks and documented defense-in-depth recommendations using CISA guidance.

### [Wireshark Protocol Security Analysis](projects/wireshark-protocol-security-analysis.md)

Used Wireshark to compare HTTP/HTTPS and FTP/SFTP traffic, identify plaintext credential exposure, and demonstrate how encryption protects sensitive data.

## Current Focus

- Completing the UF Certified Cybersecurity Associate Program
- Developing SOC-relevant skills in log analysis, detection, incident response, and endpoint monitoring
- Building hands-on SIEM and cross-platform monitoring projects
- Preparing for entry-level IT support, cybersecurity internship, and SOC analyst opportunities
