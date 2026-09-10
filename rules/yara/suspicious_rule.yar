rule Suspicious_Command_Indicators
{
    meta:
        author = "Benjamin Pham"
        description = "Detects multiple suspicious command indicators in training files"

    strings:
        $encoded_command = "powershell -enc" nocase
        $credential_dump = "credential_dump" nocase
        $mimikatz = "mimikatz" nocase

    condition:
        2 of them
}
