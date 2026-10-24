#!/usr/bin/env bash
# amrron_sitrep_v5.0.sh
# Interactive generator for AmRRON Situation Report (SitRep) v5.00
# Outputs plain text suitable for email or voice transmission.

set -euo pipefail

echo "========================================================"
echo "=== AmRRON Situation Report (SitRep) v5.00 Generator ==="
echo "========================================================"
echo "Press Enter to accept defaults."
echo

# Helper: prompt with optional default
prompt() {
  local var_name="$1"
  local prompt_text="$2"
  local default="${3:-}"
  local input
  if [[ -n "$default" ]]; then
    read -rp "$prompt_text [$default]: " input
    printf -v "$var_name" '%s' "${input:-$default}"
  else
    read -rp "$prompt_text: " input
    printf -v "$var_name" '%s' "$input"
  fi
}

# --- Collect fields ---

prompt TO "1. To (Recipient)"
prompt FROM "2. From (Sender)"

echo
echo "3. Message Precedence"
echo "  [Enter]=Routine (R)  P=Priority  I=Immediate  F=Flash"
read -rp "Precedence: " PREC
PREC="${PREC^^}"
case "$PREC" in
  P) PREC_TXT="Priority" ;;
  I) PREC_TXT="Immediate" ;;
  F) PREC_TXT="Flash" ;;
  *) PREC_TXT="Routine"; PREC="R" ;;
esac

prompt STATE "4. State (ST)"
prompt GRID "5. Grid (Of reported location)"

echo
echo "6. Size and Scope"
echo "  [Enter]=Local (L)  R=Regional  N=National  U=Unknown"
read -rp "Scope: " SCOPE
SCOPE="${SCOPE^^}"
case "$SCOPE" in
  R) SCOPE_TXT="Regional" ;;
  N) SCOPE_TXT="National" ;;
  U) SCOPE_TXT="Unknown" ;;
  *) SCOPE_TXT="Local"; SCOPE="L" ;;
esac

prompt DTG "7. DTG (YYMMDD-HHMMz)"
prompt EXPIRATION "8. Expiration (YYMMDD-HHMMz)"

echo
echo "9. Status (Incident Status)"
echo "  [Enter]=New (N)  O=Ongoing  R=Resolved  U=Unknown"
read -rp "Status: " STATUS
STATUS="${STATUS^^}"
case "$STATUS" in
  O) STATUS_TXT="Ongoing" ;;
  R) STATUS_TXT="Resolved" ;;
  U) STATUS_TXT="Unknown" ;;
  *) STATUS_TXT="New"; STATUS="N" ;;
esac

echo
echo "10. Narrative (Concisely describe the situation)"
echo "  (Type your narrative. Type 'DONE' on a new line or press Enter twice when finished)"
NARRATIVE=""
while IFS= read -r line; do
    [[ "$line" == "DONE" ]] && break
    [[ -z "$line" && -z "$NARRATIVE" ]] && break 
    if [[ -z "$NARRATIVE" ]]; then
        NARRATIVE="$line"
    else
        NARRATIVE="$NARRATIVE"$'\n'$line
    fi
done

# --- Generate output ---
{
  echo "============================================"
  echo "===AmRRON Situation Report (SITREP) v5.00==="
  echo "============================================"  
  echo

  [[ -n "$TO" ]]         && echo "1. To: $TO"
  [[ -n "$FROM" ]]       && echo "2. From: $FROM"
  echo "3. Message Precedence: $PREC_TXT ($PREC)"
  [[ -n "$STATE" ]]      && echo "4. State: $STATE"
  [[ -n "$GRID" ]]       && echo "5. Grid: $GRID"
  echo "6. Size and Scope: $SCOPE_TXT ($SCOPE)"
  [[ -n "$DTG" ]]        && echo "7. DTG: $DTG"
  [[ -n "$EXPIRATION" ]] && echo "8. Expiration: $EXPIRATION"
  echo "9. Status: $STATUS_TXT ($STATUS)"

  if [[ -n "$NARRATIVE" ]]; then
    echo
    echo "10. Narrative:"
    echo "$NARRATIVE"
  fi
  echo
  echo "==================="
  echo "===End of Report==="
  echo "==================="
  echo "Sample filename: CALL-ST-RR-YYMMDD-HHMMZ-REPORT"
}






















































































































