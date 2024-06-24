#!/bin/bash

# Function to initialize the src and bin directories
initialize_directories() {
    src_dir="src"
    bin_dir="bin"

    if [ ! -d "$src_dir" ]; then
        mkdir "$src_dir"
        echo "Created src directory"
    else
        echo "src directory already exists"
    fi

    if [ ! -d "$bin_dir" ]; then
        mkdir "$bin_dir"
        echo "Created bin directory"
    else
        echo "bin directory already exists"
    fi
}

# Check if the user provided an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <main_class_name|init>"
    exit 1
fi

# Handle the 'init' argument to create src and bin directories
if [ "$1" == "init" ]; then
    initialize_directories
    exit 0
fi

# Assign argument to main_class variable
main_class="$1"

# Define the source and bin directories
src_dir="src"
bin_dir="bin"

# Check if the src directory exists
if [ ! -d "$src_dir" ]; then
    echo "Error: The src directory does not exist :("
    exit 1
fi

# Create the bin directory if it doesn't exist
if [ ! -d "$bin_dir" ]; then
    mkdir "$bin_dir"
fi

# Compile all Java files in the src directory and place the .class files in the bin directory
javac -d "$bin_dir" "$src_dir"/*.java

# Check if the compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful! Running the program..."
    
    # Run the Java program from the bin directory
    java -cp "$bin_dir" "${main_class%%.*}"
else
    echo "Compilation failed :("
fi

