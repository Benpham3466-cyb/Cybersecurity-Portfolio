# Wireshark TCP SYN Scan Investigation

## Overview

In this guided UF training lab, I investigated a supplied packet capture in Wireshark inside a Windows training virtual machine. I used conversation statistics, display filters, packet timestamps, and TCP stream analysis to identify scanning activity and interpret the target's responses.

This report was prepared with AI coaching and writing assistance. The findings below are based on the packet details and statistics visible in screenshots collected during the exercise. The original capture is not redistributed.

## Findings

| Item | Observation |
|---|---|
| Suspected scanner / attacker in the lab | `172.31.55.149` |
| Target | `172.31.55.198` |
| First observed scan packet | Frame 1817 |
| Timestamp of that packet | May 20, 2020, 06:05:01.642345 UTC |
| Relative time | 32.273418 seconds after capture start |
| Observed behavior | Rapid TCP SYN probes to many destination ports |
| Detailed exchange inspected | TCP stream 9, target port 445 |
| Exchange result | SYN → SYN/ACK → RST; no completed three-way handshake in this stream |

The timestamp is the first observed scan packet in the reviewed traffic, not proof that all attacker activity began at that moment. The capture's date is distinct from the date the training exercise was completed.

## 1. Identify a lead using conversation statistics

I opened **Statistics → Conversations → IPv4**. The conversation between the scanner and target contained 10,066 packets over approximately 22.12 seconds:

- 10,004 packets from `172.31.55.149` to `172.31.55.198`.
- 62 packets in the reverse direction.

This imbalance was a reason to inspect the traffic, not sufficient evidence by itself to classify it as an attack.

I filtered the scanner's outgoing traffic:

```wireshark
ip.src == 172.31.55.149
```

The visible packets rapidly targeted different destination ports with TCP SYN flags. This behavior, combined with the conversation statistics, supported the port-scan assessment.

## 2. Establish the timestamp

I selected frame 1817 and expanded its **Frame** details. The **Arrival Time** field showed:

```text
May 20, 2020 06:05:01.642345000 Coordinated Universal Time
```

Using the explicit UTC timestamp avoids confusing seconds since capture start with the actual date and time.

## 3. Inspect destination ports

To isolate initial SYN probes between these hosts, I used:

```wireshark
ip.src == 172.31.55.149 && ip.dst == 172.31.55.198 && tcp.flags.syn == 1 && tcp.flags.ack == 0
```

I examined TCP Conversations and TCP Endpoints with **Limit to display filter** enabled. Ports paired with the target address were the destination ports; the scanner's source ports were not the services being probed.

Examples visible in the reviewed tables:

```text
21, 22, 23, 53, 80, 110, 111, 113, 135, 139, 143, 199,
256, 443, 445, 554, 587, 995, 1025, 1720, 1723, 3306,
3389, 5900, 8080
```

This is a list of observed examples, not an exhaustive list of all unique destination ports. Conversation counts also do not equal unique port counts: different source ports can create multiple conversations targeting the same service.

Because this filter includes only outgoing SYN probes, zero reverse-direction counts in the filtered statistics do not establish that the target never replied.

## 4. Examine responses and a TCP stream

I searched for the target's SYN/ACK responses:

```wireshark
ip.src == 172.31.55.198 && ip.dst == 172.31.55.149 && tcp.flags.syn == 1 && tcp.flags.ack == 1
```

The results included responses from ports 445, 135, and 53, indicating those TCP ports were accepting connection attempts at the time of capture.

I selected frame 1822 and used **Follow → TCP Stream**, then closed the content window to view the packets under:

```wireshark
tcp.stream eq 9
```

### Packet evidence: port 445

All times below are UTC on May 20, 2020. Values are transcribed from the Wireshark screenshots.

| Frame | Time | Source | Destination | TCP flags |
|---|---|---|---|---|
| 1820 | 06:05:01.642517 | 172.31.55.149:41749 | 172.31.55.198:445 | SYN |
| 1822 | 06:05:01.642603 | 172.31.55.198:445 | 172.31.55.149:41749 | SYN, ACK |
| 1829 | 06:05:01.643095 | 172.31.55.149:41749 | 172.31.55.198:445 | RST |

A normal completed handshake is **SYN → SYN/ACK → ACK**. Here, the scanner reset the attempt after receiving the SYN/ACK. The observed sequence is consistent with a **half-open TCP SYN scan**.

Although the exercise described a three-way handshake, this specific captured exchange did not complete one. The conclusion follows the packet evidence. It does not establish that every other stream in the capture behaved identically.

## Conclusion and limitations

The reviewed traffic supports identifying `172.31.55.149` as the scanner targeting `172.31.55.198`. The combination of rapid probes across ports and the SYN → SYN/ACK → RST exchange on port 445 is consistent with TCP SYN scanning.

This analysis demonstrates reconnaissance activity, not successful exploitation, account access, or data theft. An open TCP port does not establish a vulnerability or independently identify the application running behind it.

The work was guided and limited to the provided training capture. Full-screen screenshots were retained locally; this public report contains transcribed evidence rather than unrelated browser content or the course capture file.

## Skills practiced

- Navigating IPv4 conversations and TCP endpoint statistics.
- Filtering by source, destination, ports, and TCP flags.
- Reading packet timestamps with an explicit time zone.
- Separating source ports from destination services.
- Following a TCP stream and interpreting SYN, SYN/ACK, and RST.
- Distinguishing observations from conclusions and recording analysis limits.
