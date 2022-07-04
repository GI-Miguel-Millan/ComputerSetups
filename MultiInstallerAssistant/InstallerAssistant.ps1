param(
[String]$InstallerJSON="installers.json", #Get the path as named parameter InstallerJSON, defaulted to "installers.csv"
[switch]$DeleteInstallerFiles,
[switch]$DownloadOnly
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
$dstParent = [System.IO.Path]::Combine($pwd, "tmp")
[System.IO.Directory]::CreateDirectory($dstParent)

# Loop through each item in the json and install it if necessary.
foreach ($item in $AllInstallersJSON)
{
	# Get the name of the item being downloaded/Installed
	$name = $item.Name
	if (!$name) { echo "Warning: Name not provided" }

	# Get the url to download from, or the local path of the installer.
	$path = $item.Path
	if (!$path) { echo "Warning: Path not provided" }

	# Check if the install can proceed.
	$shouldInstall = ($item.Install) -and ($name) -and ($path)
	if (!$shouldInstall) 
	{ 
		echo "Skipping install for $item `n"
		continue 
	}

	# If the path starts with a winget command, use the windows package manager to download and install the software.
	$isWingetPackage = $path.StartsWith("winget")
	if ($isWingetPackage)
	{
		echo "Using winget package manager `n"
		if ($DownloadOnly) { $path = $path.Replace("install", "search") }
		Invoke-Expression $path
		continue
	}

	# Get the name of the file being downloaded from the last element of the path
	$fileName = $path.Split('/') | Select-Object -Last 1 

	# If the extension of the target file is not a valid extension ["exe", "msi", zip"],
	# then we will default to using the $name specified in the json object
	$fileExt = [System.IO.Path]::GetExtension($path)
	if (($fileExt -ne ".exe") -and ($fileExt -ne ".msi") -and ($fileExt -ne ".zip"))
	{
		# see if we have been provided with a hint for the extension
		$hintExt = $item.HintExtension
		if (!$hintExt)
		{
			echo "Warning: no extension was specified. Defaulting to 'exe'"
			$hintExt = "exe"
		}
		$fileName = [string]::Format("{0}_Installer.{1}", $name, $hintExt)
		echo "Path doesn't have a valid extension, generating temporary file name: $fileName"
	}

	# Set the installer path
	$installerPath = $null
	if (Test-Path -Path $path) # check if the path is local 
	{
		$installerPath = $path
		echo "Local Path detected. Run installer from: $installerPath"
	}else 
	{
		# Create a temporary folder for downloading
		$dstFolder = [System.IO.Path]::Combine($dstParent, $name)
		[System.IO.Directory]::CreateDirectory($dstFolder)
		
		$installerPath = [System.IO.Path]::Combine($dstFolder, $fileName)

		echo "Start downloading $name from $path"
		#Invoke-WebRequest $path -OutFile $installerPath
		Start-BitsTransfer -Source $path -Destination $installerPath
		echo "$name downloaded to $installerPath"
	}

	# If the downloaded/local file is a zip, we need to extract it and run the exe/msi installer.
	if ($fileExt -eq '.zip')
	{
		# extract the zip file to parent directory
		$folderName = [System.IO.Directory]::GetParent($installerPath)
		Expand-Archive -Path $installerPath -DestinationPath $folderName

		# Locate the exe or msi file
		$locatedExecutables = Get-ChildItem -Path $folderName -Include "*.exe", "*.msi" -Recurse | %{$_.FullName}
		
		if ($locatedExecutables)
		{
			# Set the new installer path to the first found executable.
			# TODO: Future-Improvement: list out each and let user select.
			$installerpath = $locatedExecutables | Select-Object -First 1
		}else
		{
			echo "Could not locate any executables within the extracted zip file! `n"
			exit 4
		}
	}

	# Run the installer, passing in any arguments that were supplied in the config.
	$args = $item.Arguments	
	if ($args)
	{
		echo "Start Installing $installerPath with arguments: $args `n"
		Start-Process $installerPath -wait -ArgumentList $args
	}else
	{
		echo "Start Installing $installerPath `n"
		Start-Process $installerPath -wait
	}
}

# Delete temporary installer files.
if ($DeleteInstallerFiles)
{
	rm -r $dstParent
}