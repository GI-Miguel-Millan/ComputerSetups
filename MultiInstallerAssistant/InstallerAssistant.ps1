param(
[String]$InstallerJSON="installers.json", #Get the path as named parameter InstallerJSON, defaulted to "installers.csv"
[bool]$DeleteInstallerFiles=[bool]::Parse("false")
) 

# Check if the provided path exists.
$fileExists = Test-Path -Path $InstallerJSON
if (!$fileExists)
{
	echo "$InstallerJSON does not exists!!"
	[Console]::ReadKey()
	exit 1
}

# Check the file extension to ensure we have a json.
$extn = [System.IO.Path]::GetExtension($InstallerJSON)
if ($extn -ne ".json")
{
	echo "$InstallerJSON must be a .json file!"
	[Console]::ReadKey()
	exit 2
}

# File exists and has the correct extension, try to import as json.
echo "Downloading installers described in: $InstallerJSON"
$AllInstallersJSON = Get-Content -Path $InstallerJSON | ConvertFrom-Json

# Check that the Json contains data.
if (!$AllInstallersJSON)
{
	echo "Json object is empty, nothing to download."
	[Console]::ReadKey()
	exit 3
}

# Create tmp folder to download installers to.
$dst = [System.IO.Path]::Combine($pwd, "tmp")
mkdir $dst

# Loop through each item in the json and install it if necessary.
[System.Collections.ArrayList]$urlsToDownload = @()
[System.Collections.ArrayList]$destinations = @()
foreach ($item in $AllInstallersJSON)
{
	$name = $item.Name
	if (!$name) { echo "Warning: Name not provided for $item" }

	$url = $item.Url
	if (!$url){ echo "Warning: URL not provided for $url" }

	$shouldInstall = ($item.Install) -and ($name) -and ($url)
	$tag = if ($shouldInstall) {"Installing"} else { "Skipping" }

	echo "$tag $name at $url `n"
	
	if (!$shouldInstall) 
	{ 
		continue 
	}
	# Get the name of the file being downloaded from the last element of the url
	$fileName = $url.Split('/') | Select-Object -Last 1 
	$dstPath = [System.IO.Path]::Combine($dst, $fileName)

	$urlsToDownload.Add($url)
	$destinations.Add($dstPath)
}

echo "Sources to Download from `n"
echo $urlsToDownload

echo "`n"
echo "Destinations To Download To `n"
echo $destinations
echo "`n"

Start-BitsTransfer -Source $urlsToDownload -Destination $destinations

$files = [System.IO.Directory]::GetFiles($dst)
foreach ($file in $files) { Start-Process $file -wait }

if ($DeleteInstallerFiles)
{
	rm -r $dst
}