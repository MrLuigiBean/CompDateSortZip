#!/bin/bash

# make sure to replace FOLDER_NAME_HERE!!

# Use C++ program to sort based on app name
g++ -std=c++17 -Wall -Wextra -Werror -Wconversion -pedantic ScreenshotSortingProgram.cpp -o ScreenshotSortingProgram.out
./ScreenshotSortingProgram.out target
rm ScreenshotSortingProgram.out
