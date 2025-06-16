import json
import os

# --- Config ---
input_path = input()  # Change if needed
output_path = os.path.splitext(input_path)[0] + ".json"

# --- Defaults ---
DEFAULT_DURATION = 2
DEFAULT_HITBOX = 25

# --- Internal ---
metadata = {}
waves = []

with open(input_path, "r", encoding="utf-8") as f:
    for line in f:
        line = line.strip()

        # Skip empty lines or comments
        if not line or line.startswith("//"):
            continue

        parts = [p.strip() for p in line.split(",")]

        key = parts[0].lower()

        # Collect metadata
        if key in {"id", "name", "description", "length", "diff"}:
            if len(parts) >= 2:
                value = parts[1]
                if key == "id" or key == "diff":
                    value = int(value)
                metadata[key] = value
            continue

        # Parse wave entries
        if len(parts) < 8:
            print(f"Skipping incomplete line: {line}")
            continue

        try:
            entry = {
                "time": int(parts[0]),
                "object_type": parts[1],
                "position": [float(parts[2]), float(parts[3])],
                "size": [float(parts[4]), float(parts[4])],
                "angle": float(parts[5]),
                "move": {
                    "speed": float(parts[6]),
                    "alpha": float(parts[7]),
                    "duration": float(parts[8]) if len(parts) >= 9 and parts[8] else DEFAULT_DURATION,
                    "show_hitbox": float(parts[9]) if len(parts) >= 10 else DEFAULT_HITBOX
                }
            }
            waves.append(entry)
        except Exception as e:
            print(f"Error parsing line: {line}\n{e}")

# Final structure
full_level_data = {
    "meta": metadata,
    "level": waves
}

# Write JSON output
with open(output_path, "w", encoding="utf-8") as f:
    json.dump(full_level_data, f, indent=2)

print(f"✅ Conversion complete.\nOutput: {output_path}")
