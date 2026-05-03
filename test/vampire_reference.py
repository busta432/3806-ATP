# test/vampire_reference.py
import os
import sys
import urllib.request
import urllib.parse
import re
import time

def call_vampire_api(problem_text, filename):
    # RemoteSOT is the dedicated programmatic API for TPTP
    url = "https://www.tptp.org/cgi-bin/RemoteSOT"
    
    # Parameters for RemoteSOT
    # We use Vampire 4.8 as the target system
    params = {
        "ProblemSource": "UPLOAD",
        "UPLOAD": problem_text,
        "System___Vampire---4.8": "System___Vampire---4.8",
        "TimeLimit___Vampire---4.8": "10",
        "Command___Vampire---4.8": "vampire --mode casc %s"
    }
    
    data = urllib.parse.urlencode(params).encode('utf-8')
    
    # Add a User-Agent to avoid being blocked as a generic bot
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) OCaml-ATP-Project/1.0",
        "Content-Type": "application/x-www-form-urlencoded"
    }
    
    req = urllib.request.Request(url, data=data, headers=headers)
    
    try:
        with urllib.request.urlopen(req) as response:
            output = response.read().decode('utf-8', errors='ignore')
            
            # RemoteSOT usually returns the raw prover output.
            # We look for the standard SZS status line.
            if "SZS status Theorem" in output or "SZS status Unsatisfiable" in output:
                return "SOLVED"
            elif "SZS status Timeout" in output:
                return "TIMEOUT"
            elif "SZS status" in output:
                match = re.search(r"SZS status (\w+)", output)
                return match.group(1) if match else "FAILED"
            else:
                # Fallback check for Vampire-specific success strings
                if "Refutation found" in output or "Success" in output:
                    return "SOLVED"
                return "FAILED"
    except Exception as e:
        return f"ERROR ({str(e)})"

def run_benchmark():
    pelletier_dir = os.path.join("benchmark", "Pelletier")
    if not os.path.exists(pelletier_dir):
        print(f"Error: Directory {pelletier_dir} not found.")
        return

    # Filter for SYN071-SYN084
    files = [f for f in os.listdir(pelletier_dir) if f.startswith("SYN0") and f.endswith(".p")]
    files = [f for f in files if 71 <= int(f[3:6]) <= 84]
    files.sort()

    if not files:
        print("No matching SYN071-SYN084 files found.")
        return

    print(f"\nEvaluating Vampire 4.8 via RemoteSOT API")
    print(f"Target: Pelletier 61-75 ({len(files)} problems)")
    print("-" * 50)
    print(f"{'Problem':<15} | {'Result':<10}")
    print("-" * 50)

    solved = 0
    total = len(files)

    for f in files:
        path = os.path.join(pelletier_dir, f)
        with open(path, 'r', encoding='utf-8') as file:
            text = file.read()
        
        result = call_vampire_api(text, f)
        if result == "SOLVED":
            solved += 1
        
        print(f"{f:<15} | {result:<10}")
        # Wait 1s between requests to be polite to the TPTP server
        time.sleep(1.0)

    print("-" * 50)
    print(f"VAMPIRE REFERENCE SUMMARY: {solved}/{total} solved ({solved/total*100:.1f}%)")

if __name__ == "__main__":
    run_benchmark()
