<#
Sources :D
	https://www.sysgeeker.com/blog/how-to-change-file-date-and-time-on-windows-10.html#Method_4_Changing_File_Date_and_Time_Using_PowerShell
	https://www.computerworld.com/article/2879205/powershell-for-beginners-scripts-and-loops.html
	https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-7.4
	https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_properties?view=powershell-7.4#object-properties
	https://learn.microsoft.com/en-us/dotnet/api/system.string.insert?view=net-8.0
#>

Write-Host ""

$space = " "
$colon = ":"
$hyphen = "-"

$stuff = Get-ChildItem ./target/*

ForEach ($file in $stuff)
{
	$filename = ($file).Name
	Write-Host $filename

	<#
	# Switch filename: 2023050219400400-A862246CB76B2B6DC14022F4545399F5

	$filenameDate = $filename.substring(0, 14)
	Write-Host $filenameDate

	# insertions are in reverse order due to them making the indices change otherwise
	$filenameDate = $filenameDate.Insert(12, $colon)
	$filenameDate = $filenameDate.Insert(10, $colon)
	$filenameDate = $filenameDate.Insert(8, $space)
	$filenameDate = $filenameDate.Insert(6, $hyphen)
	$filenameDate = $filenameDate.Insert(4, $hyphen)
	#>

	<#
	# Phone screenshot filename: Screenshot_20231201-080729_X.jpg

	$filenameDate = $filename.substring(11, 15)
	Write-Host $filenameDate

	$filenameDate = $filenameDate.Remove(8, 1)
	# insertions are in reverse order due to them making the indices change otherwise
	$filenameDate = $filenameDate.Insert(12, $colon)
	$filenameDate = $filenameDate.Insert(10, $colon)
	$filenameDate = $filenameDate.Insert(8, $space)
	$filenameDate = $filenameDate.Insert(6, $hyphen)
	$filenameDate = $filenameDate.Insert(4, $hyphen)
	#>

	<#
	# Phone camera filename: 20230426_133807.mp4
	#>

	$filenameDate = $filename.substring(0, 15)
	Write-Host $filenameDate

	$filenameDate = $filenameDate.Remove(8, 1)
	# insertions are in reverse order due to them making the indices change otherwise
	$filenameDate = $filenameDate.Insert(12, $colon)
	$filenameDate = $filenameDate.Insert(10, $colon)
	$filenameDate = $filenameDate.Insert(8, $space)
	$filenameDate = $filenameDate.Insert(6, $hyphen)
	$filenameDate = $filenameDate.Insert(4, $hyphen)

	Write-Host $filenameDate

	Write-Host ($file).CreationTime
	Write-Host ($file).LastWriteTime

	# THIS IS WHERE THE GOOD STUFF HAPPENS
	Write-Host "==================================="
	($file).CreationTime = $filenameDate
	($file).LastWriteTime = $filenameDate

	Write-Host ($file).CreationTime
	Write-Host ($file).LastWriteTime

	Write-Host ""
}

Write-Host ""
