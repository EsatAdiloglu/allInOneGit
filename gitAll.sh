#!/bin/bash

O_arg=""

while getopts "O:" opt; do
    case $opt in
        O)
            O_arg="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            exit 1
            ;;
    esac
done

shift $((OPTIND-1))

git add .
git commit -m "$1"

if [ -z "$O_arg" ]; then
    git push 
else
    git push origin "$O_arg"
fi
