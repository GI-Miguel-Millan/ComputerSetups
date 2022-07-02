param([String]$InstallerCSV="installers.csv")
$fileExists = Test-Path -Path $InstallerCSV

if (!$fileExists)
{
	echo "$InstallerCSV does not exists!!"
	exit 1
}

echo "Downloading installers described in: $InstallerCSV"

mkdir "tmp"
$dst = "tmp"

# For each 
$url = "https://github.com/ankitects/anki/releases/download/2.1.54/anki-2.1.54-windows-qt5.exe"
