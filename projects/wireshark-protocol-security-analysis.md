# Wireshark Protocol Security Analysis

## Project Overview

This project documents two authorized cybersecurity training labs using Wireshark to examine how encrypted and unencrypted protocols handle sensitive information.

The analysis compared:

* HTTP with HTTPS
* FTP with SFTP/SSH

The labs demonstrated why encrypted protocols are essential for protecting login credentials, filenames, and transmitted data.

## Objectives

* Capture and inspect network packets with Wireshark
* Apply display filters to locate relevant traffic
* Identify sensitive information transmitted in plaintext
* Compare encrypted and unencrypted protocols
* Explain the security risks of legacy protocols

## Tools and Environment

* Wireshark
* Authorized cybersecurity training environment
* Simulated network traffic and credentials
* HTTP, HTTPS/TLS, FTP, SFTP, and SSH protocols

## Lab 1: HTTP vs. HTTPS Analysis

I applied HTTP and TLS display filters to examine web login traffic.

### Findings

* HTTP traffic exposed login information in readable plaintext.
* Packet 4 contained an unsuccessful login attempt.
* Packet 29 contained a successful login attempt.
* The exact training credentials are intentionally omitted from this public report.
* HTTPS traffic protected the transmitted information through TLS encryption.
* The contents of encrypted packets were unreadable during normal packet inspection.

### Security Significance

HTTP does not protect information while it travels across a network. An attacker who captures the traffic may be able to read usernames, passwords, and other sensitive data.

HTTPS uses TLS encryption to protect the data in transit.

## Lab 2: FTP vs. SFTP/SSH Analysis

I filtered captured traffic for FTP activity and examined the authentication and file-transfer packets.

### Findings

* FTP exposed a username and password in readable plaintext.
* The transferred filename, `report.txt`, was visible in the packet capture.
* The exact training password is intentionally omitted.
* SFTP and SSH encrypted the session.
* Credentials and filenames could not be read directly from the encrypted traffic.

### Security Significance

Traditional FTP transmits authentication details and file information without encryption. Anyone capable of intercepting the traffic may be able to recover that information.

SFTP operates through SSH and protects credentials, commands, filenames, and transferred data with encryption.

## Protocol Comparison

| Protocol | Encryption     | Information Visible in Capture                                  |
| -------- | -------------- | --------------------------------------------------------------- |
| HTTP     | No             | Login information and transmitted content may be readable       |
| HTTPS    | Yes, using TLS | Packet metadata is visible, but protected content is unreadable |
| FTP      | No             | Credentials, commands, and filenames may be readable            |
| SFTP/SSH | Yes            | Session contents and credentials are encrypted                  |

## Skills Demonstrated

* Network packet analysis
* Wireshark display filtering
* Protocol identification
* Plaintext credential detection
* HTTP and HTTPS traffic comparison
* FTP and SFTP/SSH traffic comparison
* Security-risk documentation
* Protection of sensitive information in public reporting

## Security Recommendations

* Use HTTPS instead of HTTP for websites handling sensitive information.
* Replace FTP with SFTP or another encrypted file-transfer protocol.
* Disable unnecessary legacy protocols.
* Monitor network traffic for unencrypted authentication attempts.
* Avoid transmitting credentials over public or untrusted networks.
* Apply defense in depth instead of relying on a single security control.

## Ethical and Privacy Note

This analysis was completed in an authorized training environment using simulated traffic. Credentials and other sensitive values have been excluded from this public report.
