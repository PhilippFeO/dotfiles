import sys

data = sys.stdin.read()
tag_name = ""
collect = False
for i, char in enumerate(data):
    if char == "#":
        collect = True
    if char == " " or char == "\t":
        collect = False
    if collect:
        tag_name += char
print(tag_name[1:])        
