Function Set-Wallpaper($Value) {
	$WallpaperKey = "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System"
	Set-ItemProperty -path $WallpaperKey -name Wallpaper -value $Value
	rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

Set-WallPaper -Value "C:\Wallpaper\DarthVader.jpg"