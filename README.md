# PowerShell script to generate a list of files based on date and file extensions

This PowerShell script allows you to generate a list of file paths that meet the following criteria:

- Created on or after a specified date and time
- Have a file extension that matches one or more specified file extensions
- Located in one or more specified directories within a source path

The script takes the following parameters:

- `$startDate`: a string representing the start date and time for the search in the "dd-MM-yyyy HH:mm:ss" format, for example "01-01-2022 00:00:00" for January 1, 2022 at midnight. The time zone assumed is Europe/Amsterdam. Note: Only using the date, and leaving out the time also works.
- `$fileExtensions`: an array of strings representing one or more file extensions to include in the search, for example ".tif", ".tiff", ".txt", ".pdf", ect..
- `$sourcePath`: a string representing the base path to search for the specified directories containing the files.
- `$folders`: an array of strings representing the names of the directories to search within the source path. Only files within these directories will be included in the search.
- `$outputFilePath`: a string representing the file path and name for the output file that will contain the list of file paths that meet the criteria.


To run the script, open a PowerShell command prompt and type the following command, replacing the parameters with your own values:

```
.\powershell-directory-crawler.ps1 -startDate "06-04-2023" -fileExtensions "*.tif","*.tiff" -sourcePath "C:\Users\dge055\scan" -folders "Scanner1","Scanner2","Scanner3","Scanner4","Scanner5" -outputFilePath "C:\Users\dge055\scan\output.txt"
```

This will generate a list of file paths that meet the specified criteria and save it to the specified output file. The user will also be prompted whether they want to open the output file or not.

Note that you must have appropriate permissions to access the source path and the specified directories within it, as well as to create the output file in the specified location.
