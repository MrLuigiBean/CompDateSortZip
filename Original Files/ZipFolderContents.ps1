<#
Sources :D
	https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/compress-archive?view=powershell-7.4#example-1-compress-files-to-create-an-archive-file
	https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/09-functions?view=powershell-7.4#parameter-validation
	https://stackoverflow.com/a/15883080 // Parameters in Powershell Functions!
#>

# why in the fresh hell is `f(1,2,3)` DIFFERENT FROM `f 1 2 3` ?!?!?!?
function MyStringAppend {
	param ([string]$str1, [string]$str2)
	$str1.Insert(($str1).Length, $str2)
}

Write-Host ""

$workingDir = ".\target"
$workingDirFolders = MyStringAppend $workingDir "\*"

$stuff = Get-ChildItem $workingDirFolders

ForEach ($folder in $stuff) {
	$folderName = ($folder).Name
	Write-Host $folderName

	ForEach ($file in Get-ChildItem $folder) {
		$filename = ($file).Name
		Write-Host $filename
	}

	# zip_path should be target\Youtube\*
	$zip_path = MyStringAppend $workingDir "\"
	$zip_path = MyStringAppend $zip_path $folderName
	$zip_path = MyStringAppend $zip_path "\*"
	Write-Host $zip_path

	# zip_dest should be target\Youtube.zip
	$zip_dest = MyStringAppend $workingDir "\"
	$zip_dest = MyStringAppend $zip_dest $folderName
	$zip_dest = MyStringAppend $zip_dest ".zip"
	Write-Host $zip_dest

	$compress = @{
		Path = $zip_path
		DestinationPath = $zip_dest
	}
	Compress-Archive @compress

	Write-Host ""
}

Write-Host ""