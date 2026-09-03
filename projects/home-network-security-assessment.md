# Home Network Security Assessment

## Project Overview

This project documents a research-based assessment of common home-network security risks and practical defensive controls. The objective was to identify areas a home user or network administrator should examine when protecting a router, wireless network, connected devices, and sensitive information.

## Assessment Scope

The assessment considered:

* Router administration
* Wi-Fi encryption and configuration
* Password security
* Guest-network separation
* Firmware and software updates
* Connected-device security
* Protection against unauthorized access
* Monitoring and recovery planning

## Risk Assessment and Recommendations

| Area                         | Potential Risk                                                               | Recommended Control                                                                  |
| ---------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| Router administrator account | Default or reused credentials could allow unauthorized configuration changes | Replace default credentials with a long, unique password and enable MFA if supported |
| Wi-Fi encryption             | Outdated encryption could expose wireless traffic                            | Use WPA3 Personal or WPA2 with AES when WPA3 is unavailable                          |
| Network name                 | A default SSID may reveal information about the router                       | Replace the default SSID with a name that does not identify the household            |
| Guest access                 | Visitors or untrusted devices could access the primary network               | Create a separate guest network                                                      |
| IoT devices                  | Poorly secured smart devices can increase the attack surface                 | Separate IoT devices when possible and disable unnecessary features                  |
| Router firmware              | Unpatched vulnerabilities may remain exploitable                             | Install firmware updates and enable automatic updates when available                 |
| Device security              | One compromised endpoint could affect other network resources                | Use endpoint protection, host firewalls, updates, and strong authentication          |
| Recovery                     | Hardware failure, malware, or human error could cause data loss              | Maintain tested backups of important information                                     |

## Defense-in-Depth Approach

No single control can protect an entire network. A stronger home-network design combines several layers:

1. Secure router-administrator credentials
2. Modern wireless encryption
3. Network separation
4. Updated firmware and devices
5. Endpoint security
6. Strong account authentication
7. Backups and recovery planning

If one layer fails, the remaining controls can reduce the effect of an attack.

## Unauthorized-Access Indicators

Possible signs requiring further investigation include:

* Unknown devices connected to the router
* Unexpected administrator-setting changes
* Unexplained network slowdowns
* Repeated authentication failures
* DNS settings that changed without authorization
* Disabled security features
* Unrecognized port-forwarding rules

## Incident-Response Priorities

If compromise is suspected:

1. Disconnect or isolate the affected device.
2. Review connected devices and router settings.
3. Change administrator and Wi-Fi credentials from a trusted device.
4. Update the router firmware.
5. Remove unknown devices and unauthorized configuration changes.
6. Scan connected systems for malware.
7. Continue monitoring for suspicious activity.

## Responsible Use of AI

ChatGPT was used as a research assistant to organize areas of concern and possible improvements. Security recommendations were reviewed against established cybersecurity guidance rather than accepted without verification.

## Skills Demonstrated

* Security-risk identification
* Home-network assessment
* Router and Wi-Fi security
* Network segmentation concepts
* Defense-in-depth planning
* Incident-response prioritization
* Security research and validation
* Technical documentation

## Reference

* [CISA: Securing Your Home Wi-Fi](https://www.cisa.gov/audiences/high-risk-communities/projectupskill/module5)

## Disclaimer

This project is an educational security assessment. It contains no router credentials, public IP addresses, device identifiers, network names, or other sensitive household information.
