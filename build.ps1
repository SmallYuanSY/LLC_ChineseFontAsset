$TimeZone = [System.TimeZoneInfo]::FindSystemTimeZoneById("China Standard Time")
$Tag = [System.TimeZoneInfo]::ConvertTime($(Get-Item assets/tmpchinesefont).LastWriteTime, $TimeZone).ToString("yyMMdd")
echo "MY_TAG=$Tag" | Out-File -FilePath $env:GITHUB_ENV -Append
$Path = "Release"
New-Item -Name "$Path" -ItemType "directory" -Force
New-Item -Path "$Path" -Name "Mods" -ItemType "directory" -Force
Copy-Item -Path assets/tmpchinesefont -Destination $Path/Mods -Force
7z a -t7z "$Path/tmpchinesefont_$Tag.7z" "./$Path/*" -mx=9 -ms