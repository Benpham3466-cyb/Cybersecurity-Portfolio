# Windows User, Group, and File Management

## Project Overview

This project documents my hands-on practice managing Windows users, local groups, passwords, and file attributes through PowerShell. The objective was to understand how administrators create accounts, organize access, verify permissions, and identify hidden files.

## Environment

* Windows client virtual machine
* PowerShell
* Authorized educational lab environment

## Objectives

* Identify the currently logged-in user
* Create and modify a local user account
* Create a local security group
* Add a user to the group
* Verify the user’s group membership
* Create, hide, and locate a hidden file

## Commands Practiced

```powershell
whoami
net user <username> <StrongPassword> /add
net user <username> <NewStrongPassword>
net localgroup
net localgroup <groupname> /add
net localgroup <groupname> <username> /add
net user <username>
echo "Sample content" > secrets.txt
attrib +H secrets.txt
dir /AH
```

Placeholders are used instead of publishing usernames or passwords from the lab.

## Work Completed

1. Used `whoami` to identify the active Windows account.
2. Created a new local user with `net user`.
3. Updated the user’s password.
4. Listed the local groups on the system.
5. Created a group for users requiring similar access.
6. Added the new user to that group.
7. Verified the account’s group membership.
8. Created a text file from the command line.
9. Applied the hidden attribute to the file.
10. Used `dir /AH` to locate and verify the hidden file.

## Security Relevance

User and group management is central to access control. Administrators can place users into groups based on their job responsibilities instead of assigning permissions individually.

This supports:

* Least privilege
* Consistent access management
* User accountability
* Faster removal of unnecessary access
* Detection of unexpected group membership

Unexpected additions to privileged groups can indicate account compromise or privilege escalation.

## Important Security Lesson

Marking a file as hidden does not encrypt or securely protect it. Hidden files can still be located with the appropriate command. Sensitive information should be protected with proper permissions, encryption, and access controls.

## Skills Demonstrated

* Windows PowerShell
* Local-user administration
* Group management
* Password management
* Membership verification
* File-attribute management
* Access-control fundamentals
* Command-line troubleshooting
* Technical documentation

## Disclaimer

This project summarizes work performed in an authorized educational environment. Passwords, private information, and proprietary course materials have been excluded.
