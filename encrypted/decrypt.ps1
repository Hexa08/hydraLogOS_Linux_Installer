# Hydra Package System - Windows File Decryptor
# Copyright (c) 2025-2045 Hydra Package System
# All rights reserved.

param(
    [Parameter(Mandatory=$true)]
    [string]$MasterKey
)

# Function to decrypt a file
function Decrypt-File {
    param (
        [string]$InputFile,
        [string]$OutputFile,
        [string]$Key
    )

    try {
        # Read encrypted data
        $encryptedData = [System.IO.File]::ReadAllBytes($InputFile)
        
        # Extract IV (first 16 bytes)
        $iv = $encryptedData[0..15]
        $encryptedBytes = $encryptedData[16..($encryptedData.Length-1)]
        
        # Create decryption key
        $keyBytes = [System.Text.Encoding]::UTF8.GetBytes($Key)
        $sha256 = New-Object System.Security.Cryptography.SHA256Managed
        $keyBytes = $sha256.ComputeHash($keyBytes)
        
        # Create AES decryption
        $aes = New-Object System.Security.Cryptography.AesManaged
        $aes.Key = $keyBytes
        $aes.IV = $iv
        
        # Create decryptor
        $decryptor = $aes.CreateDecryptor()
        
        # Decrypt the data
        $decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytes, 0, $encryptedBytes.Length)
        
        # Convert to string and save
        $decryptedText = [System.Text.Encoding]::UTF8.GetString($decryptedBytes)
        [System.IO.File]::WriteAllText($OutputFile, $decryptedText)
        
        Write-Host "File decrypted successfully: $InputFile" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "Error decrypting file $InputFile : $_" -ForegroundColor Red
        return $false
    }
}

# List of encrypted files
$files = @(
    "hpkg.enc",
    "hpkg-install.enc",
    "hpkg-encrypt.enc",
    "build-package.sh.enc",
    "example-package/control/control.txt.enc",
    "example-package/scripts/postinst.sh.enc",
    "example-package/data/usr/bin/example-app.enc",
    "README.md.enc",
    "LICENSE.enc",
    "COPYRIGHT.enc"
)

# Decrypt each file
foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "Decrypting $file..." -ForegroundColor Blue
        $decryptedFile = $file -replace '\.enc$', ''
        $success = Decrypt-File -InputFile $file -OutputFile $decryptedFile -Key $MasterKey
        if ($success) {
            Write-Host "Successfully decrypted: $file" -ForegroundColor Green
        }
    }
    else {
        Write-Host "Warning: File not found - $file" -ForegroundColor Yellow
    }
}

Write-Host "All files decrypted successfully!" -ForegroundColor Green
