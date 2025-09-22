import json
import re
import os

level_object_list = [
    ["all_spike_saw",0.065], #0
    ["circle",0.065], #1
    ["star",0.065], #2
    ["halfcircle",0.07], #3
    ["enemy",0.5], #4
    ["house",0.07],#5
    ["moon",0.063],#6
    ["rectangle",0.065], #7
    ["rounded_polygon",0.065],#8
    ["rounded_rect",0.065],#9
    ["snake",0.05],#10
    ["spike",0.05],#11
    ["spike_floor",0.065],#12
    ["spike_saw",0.065],#13
    ["spike_saw_hole",0.065],#14
    ["sun",0.065],#15
    ["large_arrow",0.065],#16
    ["heart",0.065],#17
    ["hexagon",0.065],#18
    ["industrial_circle",0.065],#19
    ["lightning",0.065],#20
    ["heart",0.065],#21 # lmao this fucker is here twice XD
    ["main_boss",0.5],#22
]

def replace_object_type_in_file(filename):
    # Build a mapping from index to object name
    index_to_name = {str(i): obj[0] for i, obj in enumerate(level_object_list)}

    # Read file
    with open(filename, 'r', encoding='utf-8') as f:
        content = f.read()

    # Replace "object_type": "<number>" with "object_type": "<name>"
    def replacer(match):
        idx = match.group(1)
        name = index_to_name.get(idx, idx)
        return f'"object_type": "{name}"'

    new_content = re.sub(r'"object_type"\s*:\s*"(\d+)"', replacer, content)

    # Write back to file (or to a new file)
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(new_content)

if __name__ == "__main__":
    script_dir = os.path.dirname(os.path.abspath(__file__))
    file_name = input()
    json_file = os.path.join(script_dir, f"{file_name}.json")
    replace_object_type_in_file(json_file)