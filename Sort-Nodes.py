import re

def atoi(text):
    return int(text) if text.isdigit() else text

def natural_keys(text):

    return [ atoi(c) for c in re.split(r'(\d+)', text) ]

node_list=["punc01n05",
'roshc01n5",
"rosh01n1",
"rosh01n3",
"rosh01n2",
"rosh01n6",
"rosh01n8",
"rosh01n7",
"rosh01n4",
"rosh01n10",
"rosh01n11",
"rosh01n9",
"rosh01n12"]

node_list.sort(key=natural_keys)
