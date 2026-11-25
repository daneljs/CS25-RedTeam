#!/usr/bin/env bash
# Operation Lockdown — harmless FIM training simulation.
set -euo pipefail
umask 077
lab=$(mktemp -d "$HOME/lockdown-lab.XXXXXXXX")
printf 'Training directory: %s\n' "$lab"
printf 'Fictional employee records\n' > "$lab/Employees.csv"
printf 'Fictional budget data\n' > "$lab/Budget_2027.txt"
printf 'Fictional financial report\n' > "$lab/Financial_report.txt"
printf 'Baseline created. Wait for FIM to register the test files.\n'
read -r -p 'Press Enter to continue the simulation: ' unused
printf 'Training marker: simulated change only\n' >> "$lab/Financial_report.txt"
printf 'Synthetic ransomware indicator; no encrypted data.\n' > "$lab/Employees.csv.locked"
printf 'Synthetic ransomware indicator; no encrypted data.\n' > "$lab/Budget_2027.txt.locked"
printf 'OPERATION LOCKDOWN\nFictional ransom note for incident response training.\nNo real files have been encrypted. No payment required.\n' > "$lab/READ_ME.txt"
printf '\n\033[31m=== OPERATION LOCKDOWN ===\033[0m\n'
printf 'Simulated ransomware incident. No real encryption or locking.\n'
printf 'Investigate FIM events in Wazuh. Test files remain in: %s\n' "$lab"
