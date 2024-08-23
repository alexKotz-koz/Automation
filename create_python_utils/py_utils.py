import os
import json


def dictKeys(dict: dict, filename: str, fileLocation=None):
    """
    Description: Prints the structure of a dictionary

    Args:
        <python dict>
        <filename.extension>
        <fileLocation> with trailing '/' (optional)
    """
    cwd = os.getcwd()
    if fileLocation:
        os.path.join(cwd, fileLocation)
    else:
        fileLocation = cwd
    with open(os.path.join(fileLocation, filename), "w") as file:
        json.dump(dict, file)
