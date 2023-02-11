#!/bin/bash

ScriptFile="/home/miguel/scripts/backup-include-exclude-list.txt"
DirToBackup="/"
BackupDir="/media/persistent/backup/eos-qtile"
DryRun=0
Verbosity=6

# Verbosity Levels:
# 0	No information given
# 1	Fatal Errors displayed
# 2	Warnings
# 3	Important messages, and maybe later some global statistics (default)
# 4	Some global settings, miscellaneous messages
# 5	Mentions which files were changed
# 6	More information on each file processed
# 7	More information on various things
# 8	All logging is dated
# 9	Details on which objects are moving across the connection

print_info () {
    echo "Backing up files from '$DirToBackup' to '$BackupDir':"

    readarray -t listIncludes < <( cat $ScriptFile )
    #declare -p listIncludes
    
    # For older versions of bash
    # IFS=$'\n' read -r -d '' -a listIncludes < <( cat $ScriptFile && printf '\0' )
    
    includes=()
    excludes=()
    
    for path in "${listIncludes[@]}"; do
        [[ "$path" == -* ]] &&
            excludes+=("$path") &&
            continue

        includes+=("$path")
    done

    # len=${#listIncludes[@]}
    # for (( i=0; i<$len; i++))
    # do
    #     path=${listIncludes[$i]}
    #    [[ $path == -* ]] && 
    #         excludes+=("${path}") &&
    #         continue
    #
    #     includes+=("${path}")
    # done

    echo "The following directories / files will be included:"
    for path in "${includes[@]}"; do
        echo "$path"
    done
    
    echo "The following directories / files will be excluded:"
    for path in "${excludes[@]}"; do
        echo "$path"
    done
}
    
[[ $DryRun -ne 0 ]] && 
    echo "Command to execute:" &&
    echo "rdiff-backup --verbosity $Verbosity --include-globbing-filelist $ScriptFile $DirToBackup $BackupDir" &&
    print_info &&
    exit 0

rdiff-backup --verbosity $Verbosity --include-globbing-filelist $ScriptFile $DirToBackup $BackupDir

echo "Backup Complete!"
