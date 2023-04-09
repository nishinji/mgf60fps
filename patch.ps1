[Environment]::CurrentDirectory = (Get-Location -PSProvider FileSystem).ProviderPath

if ( -Not(Test-Path "eboot.bin")) {
    Write-Output "Put your eboot.bin in this folder."
    Start-Sleep -Seconds 2
    Return
}

$FileHash = Get-FileHash eboot.bin -Algorithm MD5

if ( -Not(Test-Path "output")) {
    New-Item "output" -ItemType Directory
}

[bool] $patched = 0

# Diva X 60fps patch by someone idk who
#PCSH00176
if ($FileHash.Hash -eq "733033E2DDF86D94FCA30B2AA1249302")
{
    $bytes = [System.IO.File]::ReadAllBytes("eboot.bin")
    Write-Output "Patching 60fps Diva X ASIA"
    $bytes[0x3A32C] = 0x1
    #0x3932c
    $bytes[0x3AA5A] = 0xf7
    #0x39a5a
    [System.IO.File]::WriteAllBytes("output/eboot.bin", $bytes)
    $patched = 1
}

# Diva X 60fps patch reference the patch above
#PCSG00683
if ($FileHash.Hash -eq "04A530196C722D1A475082C57D85CFD7")
{
    $bytes = [System.IO.File]::ReadAllBytes("eboot.bin")
    Write-Output "Patching 60fps Diva X JP"
    $bytes[0x3A320] = 0x1
    $bytes[0x3AA4E] = 0xf7
    [System.IO.File]::WriteAllBytes("output/eboot.bin", $bytes)
    $patched = 1
}

#PCSG00610
if ($FileHash.Hash -eq "9E50BD28879FC721AB724E97141F9D8A") {
    $bytes = [System.IO.File]::ReadAllBytes("eboot.bin")
    Write-Output "Patching 60fps Miracle Girls Festival"
    $bytes[0x4F464] = 0x1
    #0x4e464
    $bytes[0x4F5C0] = 0xf7
    #0x4e5c0
    [System.IO.File]::WriteAllBytes("output/eboot.bin", $bytes)
    $patched = 1
}

#PCSE00326
if ($FileHash.Hash -eq "3727CEE0C28313B961634C15B3F7EA33") {
    $bytes = [System.IO.File]::ReadAllBytes("eboot.bin")
    Write-Output "Patching 60fps Diva f US"
    $bytes[0x4F767E] = 0x1
    #0x4f667e
    $bytes[0x14764] = 0x1
    #0x13764
    $bytes[0x149E8] = 0xf7
    #0x139e8
    [System.IO.File]::WriteAllBytes("output/eboot.bin", $bytes)
    $patched = 1
}

#PCSG00074
if ($FileHash.Hash -eq "94AA36566BACEA2DC53ACA96920B3EC3") {
    $bytes = [System.IO.File]::ReadAllBytes("eboot.bin")
    Write-Output "Patching 60fps Diva f JP"
    $bytes[0x4A5316] = 0x1
    $bytes[0x142A7] = 0x1
    $bytes[0x14538] = 0xf7
    [System.IO.File]::WriteAllBytes("output/eboot.bin", $bytes)
    $patched = 1
}

#PCSG00205
if ($FileHash.Hash -eq "7A88C431078FF1F469ED83C0B5ABB1B4") {
    $bytes = [System.IO.File]::ReadAllBytes("eboot.bin")
    Write-Output "Patching 60fps Diva F 2nd JP"
    $bytes[0xBA3C] = 0x1
    $bytes[0xBB9A] = 0xf7
    [System.IO.File]::WriteAllBytes("output/eboot.bin", $bytes)
    $patched = 1
}

#PCSG00116
if ($FileHash.Hash -eq "2B9A7176C6AA0E26D0CE3AFE505E7451")
{
    $bytes = [System.IO.File]::ReadAllBytes("eboot.bin")
    Write-Output "Patching Assassin's Creed III Lady Liberty JP"
    $bytes[0xEBC2] = 0x1
    [System.IO.File]::WriteAllBytes("output/eboot.bin", $bytes)
    $patched = 1
}

#PCSG00783
if ($FileHash.Hash -eq "174E6FB6B526C9E510B39980BBD6CCAC")
{
    $bytes = [System.IO.File]::ReadAllBytes("eboot.bin")
    Write-Output "Patching Project Root JP"
    $bytes[0x1186BC] = 0x1
    [System.IO.File]::WriteAllBytes("output/eboot.bin", $bytes)
    $patched = 1
}

<# not work, comment out
#PCSC00006
if ($FileHash.Hash -eq "7B1218320937AF70FA97562DE08E5DFC")
{
    $bytes = [System.IO.File]::ReadAllBytes("eboot.bin")
    Write-Output "WipEout 2048"
    $bytes[0x2F7D0A] = 0xFCF022E8 12E0
    $bytes[0x2F7D4A] = 0x8042
    [System.IO.File]::WriteAllBytes("output/eboot.bin", $bytes)
    $patched = 1
}
#>

if ($patched) {
    Write-Output "Done. output\eboot.bin"
}
else {
    Write-Output "Game is not supported."
}

Start-Sleep -Seconds 2

