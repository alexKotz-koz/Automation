#!/bin/bash

# Check if a project name is provided
# Check if the first argument is provided
if [ -z "$1" ]; then
    # If not, print a message and exit
    echo "Usage: ./create_python.sh <project_name> <destination_directory> <project_type: web or standard>"
    exit 1
fi

# Check if the second argument is provided
if [ -z "$2" ]; then
    # If not, print a message and exit
    echo "Usage: ./create_python.sh <project_name> <destination_directory> <project_type: web or standard>"
    exit 1
fi

# Check if the third argument is provided
if [ -z "$3" ]; then
    # If not, print a message and exit
    echo "Usage: ./create_python.sh <project_name> <destination_directory> <project_type: web or standard>"
    exit 1
fi


# Set the project name
project_name=$1

# Store script dir
script_dir=$(pwd)

# Set the destination directory, defaulting to the current directory if not provided
destination_directory=${2:-.}

# Create the project directory in the specified destination directory
mkdir -p "$destination_directory/$project_name"
project_dir="$destination_directory/$project_name"
cd $project_dir
#cd "$destination_directory/$project_name"


# Create basic project structure
mkdir src
if [ "$3" = "web" ]; then
	mkdir src/frontend
	touch src/frontend/main.ipynb
	mkdir src/backend
	mkdir src/secrets
	cp "$script_dir/py_utils.py" "$project_dir/src"
elif [ "$3" = "standard" ]; then
	mkdir src/components
	touch "README.md"
	echo $script_dir
	cp "$script_dir/py_utils.py" "$project_dir"
	echo "here"
	ls "$project_dir/src/"
fi

touch README.md
ls .
# Define source and destination directories

mkdir src/data
mkdir docs
mkdir tests
touch requirements.txt
touch .gitignore

# Create a virtual environment
#python3 -m venv venv

# Create a main Python script (e.g., main.py)
echo 'import pandas as pd' >> src/main.py
echo 'import numpy as np' >> src/main.py
echo 'def main():' >> src/main.py
echo '    pass' >> src/main.py
echo '' >> src/main.py
echo 'if __name__ == "__main__":' >> src/main.py
echo '    main()' >> src/main.py

# Create main Test script
echo 'def test_main():' >> tests/main_test.py
echo '	pass' >> tests/main_test.py
echo '' >> tests/main_test.py
echo 'if __name__=="__main__":' >> tests/main_test.py
echo '	test_main()' >> tests/main_test.py
echo '	print("Everything passed")' >> tests/main_test.py

# Create virtual environment
python3 -m venv venv

source venv/bin/activate

pip install --upgrade pip

pip install ipykernel pandas matplotlib

# Print a success message
echo "Project scaffolding for '$project_name' created successfully!"

