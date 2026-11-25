
#!/usr/bin/env bash
# Operation Lockdown V1.1 – ofarlig simulering för Wazuh FIM.
# Körs endast i labbmiljö. Inga befintliga dokument påverkas.

# Avbryt vid fel och begränsa åtkomsten till testfilerna.
set -euo pipefail
umask 077

# Skapa en unik testkatalog i användarens hemkatalog.
lab=$(mktemp -d "$HOME/lockdown-lab.XXXXXXXX")
printf 'Training directory: %s\n' "$lab"

# Skapa fiktiva företagsdokument.
printf 'Fictional employee records\n' > "$lab/Employees.csv"
printf 'Fictional budget data\n' > "$lab/Budget_2027.txt"
printf 'Fictional financial report\n' > "$lab/Financial_report.txt"
printf 'Meeting agenda\n' > "$lab/Meeting_notes.txt"
printf 'Office equipment inventory\n' > "$lab/Inventory.txt"

# Pausa så att FIM kan registrera ursprungsfilerna.
printf 'Baseline created. Wait for FIM to register the test files.\n'
read -r -p 'Press Enter to continue the simulation: ' unused

# Simulera vanliga uppdateringar av företagsdokument.
printf 'Meeting completed\n' >> "$lab/Meeting_notes.txt"
printf 'Inventory reviewed\n' >> "$lab/Inventory.txt"

# Skapa ofarliga ransomwareindikatorer. Ingen kryptering sker.
printf 'Training marker: simulated change only\n' >> "$lab/Financial_report.txt"
printf 'Synthetic ransomware indicator; no encrypted data.\n' > "$lab/Employees.csv.locked"
printf 'Synthetic ransomware indicator; no encrypted data.\n' > "$lab/Budget_2027.txt.locked"
printf 'OPERATION LOCKDOWN\nFictional ransom note for incident response training.\nNo real files have been encrypted. No payment required.\n' > "$lab/READ_ME.txt"

# Visa resultatet och lämna testfilerna kvar för analys.
printf '\n\033[31m=== OPERATION LOCKDOWN ===\033[0m\n'
printf 'Simulated ransomware incident. No real encryption or locking.\n'
printf 'Investigate FIM events in Wazuh. Test files remain in: %s\n' "$lab"
