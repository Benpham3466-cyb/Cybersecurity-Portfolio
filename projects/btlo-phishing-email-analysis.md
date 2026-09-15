# Phishing Email Analysis — Blue Team Labs Online

**Analyst:** Ben Pham  
**Completed:** September 14, 2026  
**Environment:** macOS, Apple Mail, raw email source, Terminal (`dig`)  
**Scope:** Guided training investigation; no production incident response.

## Summary

I completed BTLO’s Phishing Analysis challenge by examining a supplied email, its delivery information, and an attached message. The attachment contained an earnings lure promising $6,500 per day and a Blogspot URL. These observations support treating the content as suspicious. The available evidence does not establish credential theft, malware execution, or recipient compromise.

## Evidence and interpretation

| Observation | Interpretation and limitation |
|---|---|
| Forwarded content included “Undeliverable: Website contact form submission” and an automated delivery-failure notice. | Delivery notices can be legitimate. Their presence alone is not evidence of phishing. |
| The notice recorded March 18, 2021 at 04:14 and reported a disabled recipient mailbox. | This is information recorded in the notice, not proof that every recipient failed to receive the message. The quoted timestamp does not state a timezone. |
| A MIME section used `Content-Type: message/rfc822`. | The file contained an attached email with its own headers and body. Fields from different message layers must not be combined without context. |
| The enclosed message contained `X-Originating-IP: 103.9.171.10`, also present in a `Received:` entry. | This identifies sending infrastructure recorded in the sample, not the attacker’s personal device or identity. |
| I ran `dig -x 103.9.171.10 +short`, which returned `c5s2-1e-syd.hosting-services.net.au.` | The current reverse-DNS result matched the hostname in the header. A match does not establish trust or prove historical DNS ownership. |
| The attached message offered “Good earnings from $6500 per day” and contained a URL using the hostname `35000usdperwwekpodf[.]blogspot[.]com`. | The earnings lure and unusually named destination warranted investigation. Blogspot hosting by itself is not malicious. |
| The browser displayed “Blog has been removed.” | This establishes the page’s observed state during the exercise. Its original content and behavior were unavailable. |

## Method and evidence handling

The archive came from the official BTLO challenge. Its extracted file was named `Website contact form submission.eml`. A byte-preserving `.txt` copy allowed inspection without rendering the email. I also used Apple Mail’s readable and Raw Source views, identified delivery headers, and performed a reverse-DNS lookup.

Apple Mail displayed the embedded message as `Mail Attachment.eml`; BTLO accepted “Website contact form submission” for its attachment-name question. I distinguish the mail-client display label from the challenge’s accepted answer.

During the exercise, I opened the sample URL directly in my normal browser and observed the removal notice; I did not use URL2PNG. This was a handling mistake. In future investigations I will inspect URLs as text and use an approved isolated analysis environment when visiting a destination is necessary.

The investigation was completed with guided assistance for navigation, source preparation, interpretation, and reporting. No claim is made that the work was performed entirely independently.

**Extracted email SHA-256:**
`1dc38b916e59e686933d831a34e6b68ac94b5e7efbeb572861dbf2ec996d3d6e`

## Conclusion and next actions

**Assessment:** Suspicious earnings-lure message. The challenge was completed, but the historical landing-page payload and recipient impact remain undetermined.

In a real investigation, I would preserve the message, establish recipient scope, and review available click, download, endpoint, and sign-in evidence. Credential entry, file execution, or unauthorized account activity would determine the appropriate response. These are proposed follow-up actions, not actions performed or findings established in this lab.

## Learning outcomes

- Distinguish readable message content from full headers and separate forwarded or attached message layers.
- Interpret `Received: from` and `by` as a recorded delivery step.
- Use reverse DNS as supporting context, not a maliciousness verdict.
- Separate suspicious content, confirmed user interaction, and confirmed compromise.
- Document the actual tools used and acknowledge missing evidence.

[Challenge](https://blueteamlabs.online/home/challenge/phishing-analysis-f92ef500ce) · [Completion record](https://blueteamlabs.online/achievement/share/challenge/176579/16)
