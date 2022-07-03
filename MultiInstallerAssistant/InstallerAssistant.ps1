param(
[String]$InstallerJSON="installers.json", #Get the path as named parameter InstallerJSON, defaulted to "installers.csv"
[switch]$DeleteInstallerFiles
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
echo "Import configuration from: $InstallerJSON"
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

[System.IO.Directory]::CreateDirectory($dst)

# Loop through each item in the json and install it if necessary.
foreach ($item in $AllInstallersJSON)
{
	# Get the name of the item being downloaded/Installed
	$name = $item.Name
	if (!$name) { echo "Warning: Name not provided for $item" }

	$url = $item.Url
	if (!$url){ echo "Warning: URL not provided for $url" }

	$shouldInstall = ($item.Install) -and ($name) -and ($url)

	if (!$shouldInstall) 
	{ 
		echo "Skipping install for $item `n"
		continue 
	}

	# Get the name of the file being downloaded from the last element of the url
	$fileName = $url.Split('/') | Select-Object -Last 1 
	$dstPath = [System.IO.Path]::Combine($dst, $fileName)

	$isLocalPath = Test-Path -Path $url
	if ($isLocalPath)
	{
		$dstPath = $url
		echo "Local Path detected. Run installer from: $dstPath"
	}else 
	{
		echo "Start downloading $name from $url"
		Start-BitsTransfer -Source $url -Destination $dstPath
		echo "$name downloaded to $dstPath"
	}

	$args = $item.Arguments	
	if ($args)
	{
		echo "Start Installing $dstPath with arguments: $args `n"
		Start-Process $dstPath -wait -ArgumentList $args
	}else
	{
		echo "Start Installing $dstPath `n"
		Start-Process $dstPath -wait
	}
}

if ($DeleteInstallerFiles)
{
	rm -r $dst
}