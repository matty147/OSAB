import json
import os

# --- Config ---
input_path = r"C:\\Users\\matty\\source\\GameMakerStudio2\\projects\\JSAB\\converter\\" + input()  # Change if needed
output_path = os.path.splitext(input_path)[0] + ".json"

# --- Defaults ---
DEFAULT_DURATION = 2
DEFAULT_HITBOX = 25

# --- Internal ---
metadata = {}
waves = []

OBJECTS = [
    "all_spike_saw",  # 0
    "circle",         # 1
    "star",           # 2
    "halfcircle",     # 3
    "enemy",          # 4
    "house",          # 5
    "moon",           # 6
    "rectangle",      # 7
    "rounded_polygon",# 8
    "rounded_rect",   # 9
    "snake",          # 10
    "spike",          # 11
    "spike_floor",    # 12
    "spike_saw",      # 13
    "spike_saw_hole", # 14
    "sun",            # 15
    "large_arrow",    # 16
    "heart",          # 17
    "hexagon",        # 18
    "industrial_circle", # 19
    "lightning",      # 20
    "heart",          # 21
    "main_boss"       # 22
]

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
                "object_type": OBJECTS[int(parts[1])] if parts[1].isdigit() else parts[1],
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
