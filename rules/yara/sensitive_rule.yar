rule Sensitive_Suspicious_Command_Indicators
{
    meta:
        author = "Benjamin Pham"
        description = "Detects any suspicious command indicator in training files"

    strings:
        $encoded_command = "powershell -enc" nocase
        $credential_dump = "credential_dump" nocase
        $mimikatz = "mimikatz" nocase

    condition:
        any of them
}
