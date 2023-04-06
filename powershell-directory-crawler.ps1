param (
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$startDate,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]$fileExtensions,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$outputFilePath,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$sourcePath,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]$folders
)

# Convert the $startDate parameter to a DateTime object in the Europe/Amsterdam time zone
$startDate = [DateTime]::ParseExact($startDate, "dd-MM-yyyy", [System.Globalization.CultureInfo]::GetCultureInfo("nl-NL")).AddHours(1)

# Loop through each folder and add every file path that meets the criteria to the $files array
$files = foreach ($folder in $folders) {
    $fullPath = Join-Path -Path $sourcePath -ChildPath $folder
    Get-ChildItem -Path $fullPath -Recurse -File -Include $fileExtensions | Where-Object {$_.CreationTime -gt $startDate} | Select-Object -ExpandProperty FullName
}

# Export the list of file paths to the specified output file
$files | Out-File -FilePath $outputFilePath -Encoding UTF8

# Prompt the user to open the output file
$openFile = Read-Host "Do you want to open the output file? (Y/N)"
if ($openFile -eq "Y") {
    Invoke-Item $outputFilePath
}
