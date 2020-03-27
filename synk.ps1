### Ordner 1 
$Ordner1 = 'C:\Users\Ali Elchab\Desktop\Folder1'
$Ordner2 = 'C:\Users\Ali Elchab\Desktop\Folder2'

$Ordner1Files = Get-ChildItem -Path $Ordner1Path
$Ordner2Files = Get-ChildItem -Path $Ordner2Path

$FileDiffs = Compare-Object -ReferenceObject $Ordner1Files -DifferenceObject $Ordner2Files

$FileDiffs | foreach {
    $copyParams = @{
        'Path' = $_.InputObject.FullName
    }
    if ($_.SideIndicator -eq '<=') 
    {
        $copyParams.Destination = $Ordner2Path
    } 
    else 
    {
        $copyParams.Destination = $Ordner1Path
    }
    Copy-Item @copyParams
}