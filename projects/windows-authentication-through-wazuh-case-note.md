# SOC case note — SocTest account and login alerts

**Disposition:** Close as **benign true positive**. No containment needed for this controlled lab activity.

**What happened:** On `SOC-WIN11`, `LabAdmin` created, enabled, and changed the local `SocTest` account. About nine minutes later, one `SocTest` login failed because of an incorrect password. A login for the same account succeeded 18 seconds later.

**Why we can close it:** Both login attempts were local to the Windows VM (`::1`, interactive logon type `2`). I confirmed that the account changes and login attempts were the planned test I performed. The alerts identified real events, but the verified activity was authorized. Document the timeline and close the lab case.

**If authorization had not been confirmed:** Verify who created `SocTest`, check its permissions and subsequent activity, and escalate if the account was not approved. Same-device activity and a quick success alone do not establish that the activity was safe.

This is a controlled home-lab case, not a workplace incident or a production ticket. I performed the test, examined the records, and made the disposition; I received coaching on setup, searching, and review of the note.

## Timeline

| Windows event time (UTC) | Event ID | Observation |
| --- | ---: | --- |
| 2026-09-21 03:26:25 | 4720 | `LabAdmin` created the local `SocTest` account. Windows Security record ID `34270`. |
| 2026-09-21 03:26:25 | 4722 | `LabAdmin` enabled `SocTest`. Record ID `34271`. |
| 2026-09-21 03:26:25 | 4738 | `LabAdmin` changed `SocTest`. Record ID `34272`; the specific changed attribute has not been confirmed. |
| 2026-09-21 03:35:48 | 4625 | One interactive login for `SocTest` failed with status `0xC000006D` and substatus `0xC000006A` (incorrect password). |
| 2026-09-21 03:36:06 | 4624 | An interactive login for `SocTest` succeeded, 18 seconds after the failure. |

Windows event times are in UTC above. The Wazuh browser showed Eastern time and displayed the corresponding alerts about two seconds later.

## Evidence

- I inspected Windows Security events `4720`, `4722`, `4738`, `4625`, and `4624` during the investigation.
- Wazuh Threat Hunting returned five `SocTest` alerts from agent `SOC-WIN11` in the selected 24-hour window.
- [Wazuh event-list screenshot](images/windows-auth-soc-test-event-list.png) shows the five alerts.
- [Successful-login detail, redacted](images/windows-auth-4624-success-redacted.png) shows event `4624`, `SocTest`, and logon type `2`.
- [Failed-login detail, redacted](images/windows-auth-4625-failure-redacted.png) shows event `4625`, `SocTest`, logon type `2`, and incorrect-password status codes. The original screenshots remain in the private evidence folder.

**Limits:** I did not verify which attribute changed in event `4738` or review broader activity after the successful login. Confirm whether the `SocTest` lab account should be retained for later exercises or removed during cleanup.

[Back to the investigation write-up](windows-authentication-through-wazuh.md)
