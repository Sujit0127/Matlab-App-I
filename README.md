# Application
This MATLAB application provides a user interface for extracting and plotting data from raw files and executing external programs. It includes functionality for selecting raw data files, executing .exe files, plotting data, and managing file paths. 

# Features:
Select Raw File: Choose and load raw .txt files for processing.
Execute .exe File: Run an external executable file and move it to a specified directory.
Plot Data: Generate plots based on selected raw data.
Select Folder: Choose a directory for saving plotted data.
Enter Run Name and Date: Input and display testing names and dates.
# Components:
#UI Elements:
Buttons for file selection, execution, and plotting.
Text fields to display statuses and input details.

#Callbacks:
raw_file: Handles raw file selection and updates the status.
<br>
file_exe: Executes an external file and handles its status.
<br>
plot: Initiates data plotting using selected files.
<br>
file_open: Opens a directory for saving plotted data.
<br>
enterInput1 and enterInput2: Prompts for run name and date.
<br>
showValues: Displays entered run name and date.
<br>
# Usage:
Select Raw File: Click the "Select Raw File" button to choose a .txt file. The file path will be displayed if selected.
<br>
Execute .exe File: Click the "Execute .exe File" button to run an external executable. The .exe file will be moved to the selected directory.
<br>
Plot Data: Click the "Plot" button to generate plots using the selected raw data.
<br>
Select Folder for Plotting: Choose a directory where plotted data will be saved.
<br>
Enter Run Name and Date: Use the "Enter Run Name" and "Enter Mission Date" buttons to input details, which will be displayed on the UI.
# Requirements:
MATLAB (version compatible with the code).
