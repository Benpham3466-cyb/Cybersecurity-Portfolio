# Linux Command-Line and Log Analysis

## Project Overview

This project documents my introductory Linux command-line and data-analysis practice. The objective was to navigate the Linux file system, manage files, inspect system information, and combine commands to search and analyze log data.

## Environment

* Linux virtual lab environment
* Bash terminal

## Commands Practiced

### Navigation and File Management

* `pwd` — displays the current working directory
* `cd` — changes directories
* `ls -la` — lists files, hidden files, and metadata
* `touch` — creates an empty file
* `nano` — edits text files
* `cat` — displays file contents
* `cp` — copies a file
* `mv` — moves or renames a file
* `mkdir` — creates a directory

### Searching and Data Analysis

* `grep` — searches text for a specified pattern
* `head` — displays the first lines of a file
* `tail` — displays the final lines of a file
* `wc -l` — counts lines
* `awk` — extracts or evaluates structured text
* `sort` — sorts data
* `|` — sends one command’s output into another command

## Work Completed

1. Navigated between Linux directories and confirmed my current location.
2. Created and edited files from the terminal.
3. Displayed file contents and created copies of files.
4. Searched package-log data for matching text with `grep`.
5. Used pipes to connect multiple commands into a single workflow.
6. Counted files and lines, extracted columns, and sorted numerical results.
7. Used an `awk` condition to identify lines containing more than 80 characters.

## Example Pipeline

```bash
grep "error" system.log | tail
```

This example searches a log for entries containing “error” and sends the matching results to `tail`, which displays the most recent matches.

## Security Relevance

Cybersecurity analysts frequently work with large log files. Pipes and filtering commands make it possible to reduce large amounts of output to the information relevant to an investigation.

These skills can help an analyst:

* Locate suspicious log entries
* Search for indicators of compromise
* Identify unusual system activity
* Review recent events
* Extract useful information from large datasets

## Key Lessons

* Linux commands are case-sensitive and require precise syntax.
* Command order matters when using pipes.
* `grep` is especially useful for filtering logs.
* Each command in a pipeline performs one task and passes its output to the next command.
* Verifying results is important before drawing a security conclusion.

## Skills Demonstrated

* Linux terminal navigation
* File and directory management
* Text searching and filtering
* Pipeline construction
* Basic log analysis
* Technical troubleshooting
* Documentation

## Disclaimer

This project summarizes work completed in an authorized educational environment. It does not contain credentials, private keys, malware, personal information, or proprietary lab materials.
