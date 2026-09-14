# Microsoft Sentinel: Investigating Authorized Azure Tag Changes

**Date:** September 2026  
**Type:** Guided home lab — Azure Activity logs, KQL, detection validation, incident triage  
**Scope:** Introductory cloud control-plane investigation; the larger Windows authentication/Sentinel project remains planned.

## Objective and contribution

Investigate whether alerts for successful resource-group tag changes represented authorized tests or activity requiring escalation.

I performed controlled tag updates, queried the activity logs, compared timestamps and correlation IDs, reviewed alerts, and confirmed the final incident disposition. Environment setup and query troubleshooting were guided. This project demonstrates lab investigation practice rather than production experience or an independently deployed SOC.

## Environment and method

The lab used a Log Analytics workspace with Microsoft Sentinel and AzureActivity data in my student subscription. The reviewed resource group contained the workspace and Sentinel solution; no virtual machine or disk appeared in that resource-group inventory.

1. Apply a harmless, planned tag change.
2. Filter AzureActivity for `MICROSOFT.RESOURCES/TAGS/WRITE` in the lab resource group.
3. Compare Start and Success records, caller, source IP, operation, target, and correlation ID.
4. Trace an alert to its supporting event instead of relying on the alert title or incident number.
5. Compare the operation with the planned action before deciding its disposition.

## Findings

Earlier tests produced multiple alerts for the same underlying operation. A shared operation correlation ID and matching event details helped distinguish duplicate detection from separate changes.

For the final controlled test, `IndependentTest=tag-review-03`, the displayed source records were:

| Record | Timestamp (UTC) |
|---|---|
| Start | 2026-09-14 02:04:13.650 |
| Success | 2026-09-14 02:04:14.244 |

These correspond to approximately 10:04 PM Eastern on September 13. Both records shared the same operation correlation ID. Comparing the full value linked the final test to **incident 5**, whose status I confirmed in the portal as **Closed — Benign Positive**. Incident 3 belonged to an earlier test; checking the correlation ID resolved that mix-up.

The authorized disposition was supported by the deliberate test and matching action, timing, caller, and source IP. A matching identity or IP alone would not prove authorization. Likewise, Success records the operation outcome, not whether the activity is benign.

## Detection query

The saved scheduled rule ran every five minutes with a 30-minute lookback, a threshold above zero results, and one alert per returned event.

```kusto
AzureActivity
| where TimeGenerated >= ago(30m)
| where ingestion_time() > ago(5m)
| where ingestion_time() <= now()
| where OperationNameValue == "MICROSOFT.RESOURCES/TAGS/WRITE"
| where ActivityStatusValue == "Success"
| where ResourceGroup =~ "rg-sentinel-home-soc"
| project TimeGenerated, Caller, CallerIpAddress, OperationNameValue, ActivityStatusValue, ResourceGroup, _ResourceId, CorrelationId
```

The event-time window allows for delayed arrivals. Ingestion-time bounds narrow the records considered in each run. The upper bound was added during duplicate-alert troubleshooting. This is the configuration tested in this lab, not a universal production detection.

## Evidence and limitations

- Source-event times above were transcribed from a Sentinel screenshot supplied during the investigation.
- Incident 5's matching correlation ID and closed benign classification were confirmed manually in the portal.
- One incident with one alert was reported during the final review, but a sustained check across subsequent rule runs was not captured. Duplicate-free operation is **not proven**.
- The precise cause of earlier duplicates remains unconfirmed.
- No closed-incident screenshot or raw log export accompanies this report. Temporary screenshot attachments could not be preserved locally during closeout.
- Personal account, source IP, subscription ID, and full correlation IDs are omitted from this public summary.
- This rule covers successful tag writes in one resource group. It does not detect failed operations, role assignments, or general account compromise. Events arriving outside the configured time bounds can require separate review.

## Cost review and retained environment

At closeout, resource-group Cost Analysis displayed **No cost reported during this period** for September 2026. I also reported no cost displayed at the student-subscription level. These observations do not guarantee zero future costs.

The workspace and Sentinel solution were intentionally retained for continued study. Cleanup is deferred, not completed. Any future Windows VM, paid data ingestion, or additional service requires a new cost review.

## Lessons and next steps

- Separate operation success from authorization.
- Use correlation IDs to connect evidence, while distinguishing operation IDs from alert IDs.
- Treat an empty query result as a reason to inspect time range and ingestion delay, not proof that no event occurred.
- Document uncertainty instead of claiming that one test validates every detection scenario.

Next validation work includes negative cases and a repeat-alert review. The larger Windows authentication phase remains ahead; this report closes the introductory tag-change investigation.
