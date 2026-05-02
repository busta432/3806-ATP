#!/usr/bin/env bash
#
# run_benchmark.sh — Multi-Engine ATP-OCaml Benchmark Runner
#

# ── Configuration ──────────────────────────────────────────────────────────
TIMEOUT=10                    # seconds per problem
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BENCHMARK_ROOT="$SCRIPT_DIR/benchmark"
RESULTS_DIR="$SCRIPT_DIR/results"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ENGINES=("Baseline" "Improved" "Resolution")

# ── Resolve target folder(s) ──────────────────────────────────────────────
if [[ $# -ge 1 ]]; then
    TARGET="$1"
    if [[ ! -d "$TARGET" ]]; then
        if [[ -d "$SCRIPT_DIR/$TARGET" ]]; then
            TARGET="$SCRIPT_DIR/$TARGET"
        else
            echo "Error: Directory '$TARGET' not found."
            exit 1
        fi
    fi
    FOLDERS=("$TARGET")
    FOLDER_LABEL=$(basename "$TARGET")
else
    FOLDERS=()
    if [[ -d "$BENCHMARK_ROOT" ]]; then
        for d in "$BENCHMARK_ROOT"/*/; do
            [[ -d "$d" ]] && FOLDERS+=("$d")
        done
    fi
    FOLDER_LABEL="ALL"
fi

if [[ ${#FOLDERS[@]} -eq 0 ]]; then
    echo "Error: No benchmark folders found."
    exit 1
fi

mkdir -p "$RESULTS_DIR"
SUMMARY_FILE="$RESULTS_DIR/multi_engine_summary_${FOLDER_LABEL}_${TIMESTAMP}.txt"

# ── Extract expected status from file header ──────────────────────────────
get_expected_status() {
    grep -m1 '^% Status' "$1" | sed 's/% Status *: *//' | tr -d '[:space:]' || echo "Unknown"
}

# ── Run one problem with a specific engine ───────────────────────────────
run_problem() {
    local file="$1"
    local engine="$2"
    local results_csv="$3"
    local total_count="$4"
    
    local folder=$(basename "$(dirname "$file")")
    local expected=$(get_expected_status "$file")
    local basename_p=$(basename "$file")

    local start_time end_time elapsed output exit_code result status steps depth inst_attempts inst_hits clauses_gen subsumptions

    start_time=$(date +%s)
    # Run with engine flag
    output=$(timeout "${TIMEOUT}s" dune exec -- atp "$file" -e "$engine" 2>&1)
    exit_code=$?
    end_time=$(date +%s)
    elapsed=$(( end_time - start_time ))

    # Parse metrics
    steps=$(echo "$output" | grep -i "^Steps:" | awk -F': ' '{print $2}' | tr -d '[:space:]' || echo "0")
    depth=$(echo "$output" | grep -i "Max tree depth" | awk -F': ' '{print $2}' | tr -d '[:space:]' || echo "0")
    inst_attempts=$(echo "$output" | grep -i "Instantiation attempts" | awk -F': ' '{print $2}' | tr -d '[:space:]' || echo "0")
    inst_hits=$(echo "$output" | grep -i "Unification hits" | awk -F': ' '{print $2}' | tr -d '[:space:]' || echo "0")
    clauses_gen=$(echo "$output" | grep -i "Clauses generated" | awk -F': ' '{print $2}' | tr -d '[:space:]' || echo "0")
    subsumptions=$(echo "$output" | grep -i "Subsumptions applied" | awk -F': ' '{print $2}' | tr -d '[:space:]' || echo "0")

    # Parse result
    if [[ $exit_code -eq 124 ]]; then
        result="Timeout"
        status="timeout"
    elif echo "$output" | grep -qi "PROVED!"; then
        if echo "$output" | grep -qi "NOT PROVED"; then
            result="Not proved"
            status="not_proved"
        else
            result="Proved"
            status="proved"
        fi
    elif [[ $exit_code -ne 0 ]]; then
        result="Error (exit $exit_code)"
        status="error"
    else
        result="Unknown"
        status="unknown"
    fi

    # Determine correctness
    local correct="FAIL"
    if [[ "$status" == "proved" && "$expected" == "Theorem" ]]; then
        correct="PASS"
    elif [[ "$status" == "not_proved" && "$expected" == "CounterSatisfiable" ]]; then
        correct="PASS"
    elif [[ "$status" == "timeout" ]]; then
        correct="TIMEOUT"
    elif [[ "$status" == "error" ]]; then
        correct="ERROR"
    fi

    # Write CSV row: file, folder, engine, expected, result, time_s, status, steps, depth, inst_attempts, inst_hits, clauses_gen, subsumptions
    echo "\"$basename_p\",\"$folder\",\"$engine\",\"$expected\",\"$result\",\"$elapsed\",\"$correct\",\"$steps\",\"$depth\",\"$inst_attempts\",\"$inst_hits\",\"$clauses_gen\",\"$subsumptions\"" >> "$results_csv"
    
    # Minimal progress to stdout
    printf "    [%4d] %-30s -> %-10s: %-10s (%ss) [%s]\n" "$total_count" "$basename_p" "$engine" "$result" "$elapsed" "$correct"
}

# ── Main Loop ─────────────────────────────────────────────────────────────
echo "============================================================"
echo "  Multi-Engine ATP-OCaml Benchmark Runner"
echo "  Target:  $FOLDER_LABEL"
echo "  Engines: ${ENGINES[*]}"
echo "  Timeout: ${TIMEOUT}s per problem"
echo "============================================================"

# Ensure opam environment
if command -v opam >/dev/null 2>&1; then eval $(opam env); fi

for engine in "${ENGINES[@]}"; do
    echo ""
    echo ">> RUNNING ENGINE: $engine"
    echo "------------------------------------------------------------"
    
    ENGINE_CSV="$RESULTS_DIR/results_${FOLDER_LABEL}_${engine}_${TIMESTAMP}.csv"
    echo "file,folder,engine,expected,result,time_s,status,steps,depth,inst_attempts,inst_hits,clauses_gen,subsumptions" > "$ENGINE_CSV"
    
    engine_total=0
    for folder in "${FOLDERS[@]}"; do
        folder_name=$(basename "$folder")
        echo "  -- $folder_name"
        
        while read -r f; do
            if [[ -n "$f" ]]; then
                ((engine_total++))
                run_problem "$f" "$engine" "$ENGINE_CSV" "$engine_total"
            fi
        done < <(find "$folder" -maxdepth 1 -name "*.p" | sort)
    done

    # Generate engine-specific summary
    pass=$(awk -F, '$7 == "\"PASS\"" {count++} END {print count+0}' "$ENGINE_CSV")
    fail=$(awk -F, '$7 == "\"FAIL\"" {count++} END {print count+0}' "$ENGINE_CSV")
    tmout=$(awk -F, '$7 == "\"TIMEOUT\"" {count++} END {print count+0}' "$ENGINE_CSV")

    # Mean/Median over non-timeout, non-error rows (column 6 = time_s)
    mean_t=$(awk -F, 'NR>1 && $7!="\"TIMEOUT\"" && $7!="\"ERROR\"" {gsub(/"/,"",$6); sum+=$6; n++} END {printf "%.1f", (n>0 ? sum/n : 0)}' "$ENGINE_CSV")
    median_t=$(awk -F, 'NR>1 && $7!="\"TIMEOUT\"" && $7!="\"ERROR\"" {gsub(/"/,"",$6); print $6}' "$ENGINE_CSV" \
        | sort -n \
        | awk '{a[NR]=$1} END {n=NR; if(n==0) print "N/A"; else if(n%2) print a[(n+1)/2]; else printf "%.1f", (a[n/2]+a[n/2+1])/2}')

    # Engine-specific stat totals (columns 10-13)
    total_inst=$(awk -F, 'NR>1 {gsub(/"/,"",$10); sum+=$10} END {print sum+0}' "$ENGINE_CSV")
    total_hits=$(awk -F, 'NR>1 {gsub(/"/,"",$11); sum+=$11} END {print sum+0}' "$ENGINE_CSV")
    total_cls=$(awk -F,  'NR>1 {gsub(/"/,"",$12); sum+=$12} END {print sum+0}' "$ENGINE_CSV")
    total_sub=$(awk -F,  'NR>1 {gsub(/"/,"",$13); sum+=$13} END {print sum+0}' "$ENGINE_CSV")

    {
        echo "Engine: $engine"
        echo "  Total:        $engine_total"
        echo "  PASS:         $pass"
        echo "  FAIL:         $fail"
        echo "  TIMEOUT:      $tmout"
        echo "  Mean time:    ${mean_t}s"
        echo "  Median time:  ${median_t}s"
        if [[ "$engine" == "Resolution" ]]; then
            echo "  Clauses gen:  $total_cls"
            echo "  Subsumptions: $total_sub"
        else
            echo "  Inst attempts: $total_inst"
            echo "  Inst hits:     $total_hits"
        fi
        echo "  CSV:          $ENGINE_CSV"
        echo "------------------------------------------------------------"
    } >> "$SUMMARY_FILE"
done

echo ""
echo "============================================================"
echo "  FINAL SUMMARY"
echo "============================================================"
cat "$SUMMARY_FILE"
echo "============================================================"
echo "Benchmarking complete."
