<#
Sources :D
	https://www.sysgeeker.com/blog/how-to-change-file-date-and-time-on-windows-10.html#Method_4_Changing_File_Date_and_Time_Using_PowerShell
	https://www.computerworld.com/article/2879205/powershell-for-beginners-scripts-and-loops.html
	https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-7.4
	https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_properties?view=powershell-7.4#object-properties
	https://learn.microsoft.com/en-us/dotnet/api/system.string.insert?view=net-8.0
	https://learn.microsoft.com/en-us/dotnet/api/system.datetime.-ctor?view=net-8.0#system-datetime-ctor(system-int32-system-int32-system-int32-system-int32-system-int32-system-int32)
	https://stackoverflow.com/a/27376469
	https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes_constructors?view=powershell-7.4#example-1---defining-a-class-with-the-default-constructor
	https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.4#-gt--ge--lt-and--le
#>

Write-Host ""

# Check if there are enough numbers in the filename for YYYYMMDDHHMMSS <- 14
$expectedDigitCount = 14

$stuff = Get-ChildItem ./target/*

ForEach ($file in $stuff)
{
	$filename = ($file).Name
	Write-Host $filename

	$digitsCount = 0
	$howManyAreIn = 0 # I don't know what to name this variable...

	# Six numbers - year, month, day, hour, minute, second
	$numbersArray = "", "", "", "", "", ""
	$numberLengthArray = 4, 2, 2, 2, 2, 2
	$numbersArrayIndex = 0

	# Obtain numbers from filename
	For ($i = 0; $i -lt $filename.Length; $i++) # comparison operators in powershell are DUMB.
	{
		$isCharDigit = [Char]::IsDigit($filename[$i])
		if ($isCharDigit)
		{
			$digitsCount++;
			
			# If all 14 digits are found, skip finding more numbers.
			if ($digitsCount -gt $expectedDigitCount)
			{
				Break
			}

			$digitChar = $filename[$i]
			
			# Append incoming digitChar with existing string in the numbersArray
			$numbersArray[$numbersArrayIndex] += $digitChar
			$howManyAreIn++;

			# Once howManyAreIn matches the expected length in numberLengthArray,
			# work on the next number instead.
			if ($howManyAreIn -ge $numberLengthArray[$numbersArrayIndex])
			{
				$numbersArrayIndex++
				$howManyAreIn = 0
			}
		}
	}

	# Not enough numbers in the filename to create a date & time? Skip this file.
	if ($digitsCount -lt $expectedDigitCount)
	{
		$msg = "Skipped file: "
		$msg += $filename
		Write-Host $msg
		Write-Host ""
		Continue
	}
	
	Write-Host $file.CreationTime
	Write-Host $file.LastWriteTime

	$filenameDateTime = [System.DateTime]::new(
		$numbersArray[0], $numbersArray[1], $numbersArray[2],
		$numbersArray[3], $numbersArray[4], $numbersArray[5])

	# THIS IS WHERE THE GOOD STUFF HAPPENS
	Write-Host "==================================="
	$file.CreationTime = $filenameDateTime
	$file.LastWriteTime = $filenameDateTime

	Write-Host $file.CreationTime
	Write-Host $file.LastWriteTime
	
	Write-Host ""
}

Write-Host ""
