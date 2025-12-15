#!/usr/bin/env bash

################################################################################
# Run Utilities Help/Dry-Run Checks
################################################################################
# Runs each script in `scripts/utilities` with common help/dry-run flags and
# reports pass/fail. This is safe to run in CI or locally.
################################################################################

set -uo pipefail
# Do not exit on non-zero to allow per-script failures to be handled gracefully

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/utilities"

declare -a HELP_FLAGS=("-h" "--help" "help" "usage")

passed=0
failed=0

echo "Running utilities help checks in: $SCRIPTS_DIR"

for script in "$SCRIPTS_DIR"/*.sh; do
    [[ -f "$script" ]] || continue
    script_name=$(basename "$script")
    echo -n "Checking $script_name ... "

    ok=false
    last_output=""
    for flag in "${HELP_FLAGS[@]}"; do
        # Try to run the script with the flag; capture output (don't exit on failure)
        if output=$(bash "$script" "$flag" 2>&1); then
            last_output="$output"
            # Heuristic: consider it OK if output contains 'Usage' or 'help' OR exits 0
            if echo "$output" | grep -qiE "usage|help|commands|options"; then
                ok=true
                break
            fi
            ok=true
            break
        else
            last_output="${output:-$(bash "$script" "$flag" 2>&1 || true)}"
        fi
    done

    if [[ "$ok" == true ]]; then
        echo -e "\e[32mOK\e[0m"
        ((passed++))
    else
        echo -e "\e[31mFAILED\e[0m"
        echo "  Output from last attempt:" >&2
        echo "$last_output" >&2
        ((failed++))
    fi

done

echo ""
echo "Summary: passed=$passed failed=$failed"
if [[ $failed -gt 0 ]]; then
    exit 2
fi

exit 0
