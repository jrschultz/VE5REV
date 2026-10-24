#!/usr/bin/env bash
# amrron_statrep_v5.1.sh
# Interactive generator for AmRRON Status Report v5.1
# Outputs plain text suitable for email or voice transmission.
# Green / empty defaults are omitted (matching the form’s “don’t transmit Green by default” behavior).

set -euo pipefail

echo "==========================================="
echo "=== AmRRON Status Report v5.1 Generator ==="
echo "==========================================="
echo "Press Enter to accept defaults (empty/Green are omitted from output)."
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

# Helper: prompt for status (G/Y/R/U)
prompt_status() {
  local var_name="$1"
  local label="$2"
  local input
  echo
  echo "$label"
  echo "  [Enter]=Green (omit)  Y=Yellow  R=Red  U=Unknown"
  read -rp "Status: " input
  input="${input^^}"  # uppercase
  case "$input" in
    Y|R|U) printf -v "$var_name" '%s' "$input" ;;
    *)     printf -v "$var_name" '%s' "" ;;  # empty = Green
  esac
}

# --- Collect fields ---
prompt TO       "1a. To (Recipient)"
prompt FROM     "1b. From (Sender)"

echo
echo "2. Size and Scope"
echo "  [Enter]=My Location  C=My Community  N=My County  R=My Region  O=Other Location"
read -rp "Code: " SCOPE
SCOPE="${SCOPE^^}"
case "$SCOPE" in
  C) SCOPE_TXT="My Community" ;;
  N) SCOPE_TXT="My County" ;;
  R) SCOPE_TXT="My Region" ;;
  O) SCOPE_TXT="Other Location" ;;
  *) SCOPE_TXT="My Location"; SCOPE="" ;;
esac

prompt DTG      "3. DTG (YYMMDD-HHMMz)"
prompt STATE    "4. State (2-letter)"
prompt GRID     "5. Grid (Maidenhead)"

echo
echo "6. Map Pin (should reflect worst status below)"
echo "  [Enter]=Green (omit)  Y=Yellow  R=Red"
read -rp "Map Pin: " MAP_PIN
MAP_PIN="${MAP_PIN^^}"
[[ "$MAP_PIN" =~ ^[YR]$ ]] || MAP_PIN=""

prompt_status POWER   "7. Commercial Power"
prompt_status WATER   "8. Public Water"
prompt_status MEDICAL "9. Medical"
prompt_status OTA     "10. Over Air Comms"
prompt_status TRAVEL  "11. Travel Conditions"
prompt_status INTERNET "12. Internet"
prompt_status FUEL    "13. Fuel"
prompt_status FOOD    "14. Food"
prompt_status CRIME   "15. Criminal Activity"
prompt_status CIVIL   "16. Civil"
prompt_status POLITICAL "17. Political"

echo
echo "18. Brief remarks (Type your remarks. Type 'DONE' on a new line or press Enter on an empty line when finished):"
echo "   (Include City and State first if reporting a location other than your own)"
REMARKS=""
while IFS= read -r line; do
    [[ "$line" == "DONE" ]] && break
    [[ -z "$line" && -z "$REMARKS" ]] && break 
    if [[ -z "$REMARKS" ]]; then
        REMARKS="$line"
    else
        REMARKS="$REMARKS"$'\n'$line
    fi
done

# --- Generate output ---
{
  echo "==================="
  echo "AmRRON STATREP v5.1"
  echo "==================="
  echo

  [[ -n "$TO" ]]   && echo "1a. To: $TO"
  [[ -n "$FROM" ]] && echo "1b. From: $FROM"
  echo "2. Size and Scope: $SCOPE_TXT"
  [[ -n "$DTG" ]]   && echo "3. DTG: $DTG"
  [[ -n "$STATE" ]] && echo "4. State: $STATE"
  [[ -n "$GRID" ]]  && echo "5. Grid: $GRID"

  [[ -n "$MAP_PIN" ]] && echo "6. Map Pin: $MAP_PIN"

  [[ -n "$POWER" ]]     && echo "7. Commercial Power: $POWER"
  [[ -n "$WATER" ]]     && echo "8. Public Water: $WATER"
  [[ -n "$MEDICAL" ]]   && echo "9. Medical: $MEDICAL"
  [[ -n "$OTA" ]]       && echo "10. Over Air Comms: $OTA"
  [[ -n "$TRAVEL" ]]    && echo "11. Travel Conditions: $TRAVEL"
  [[ -n "$INTERNET" ]]  && echo "12. Internet: $INTERNET"
  [[ -n "$FUEL" ]]      && echo "13. Fuel: $FUEL"
  [[ -n "$FOOD" ]]      && echo "14. Food: $FOOD"
  [[ -n "$CRIME" ]]     && echo "15. Criminal Activity: $CRIME"
  [[ -n "$CIVIL" ]]     && echo "16. Civil: $CIVIL"
  [[ -n "$POLITICAL" ]] && echo "17. Political: $POLITICAL"

  if [[ -n "$REMARKS" ]]; then
    echo
    echo "18. Brief remarks:"
    echo "$REMARKS"
  fi

  echo
  echo "============="
  echo "End of Report"
  echo "============="
  echo "Filename: CALL-ST-RR-YYMMDD-HHMMZ-REPORT"
}













































































































































