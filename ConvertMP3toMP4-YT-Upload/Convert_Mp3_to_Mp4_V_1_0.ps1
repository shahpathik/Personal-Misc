[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
$mp3_locaton
$image_locaton
$videp_mp4_locaton
$ffmpeg_lib_location = "C:\Tools\ffmpeg\bin\ffmpeg.exe"
Function Get-FileName {
 
    param($initialfile)
     
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = ".\"
    $OpenFileDialog.filter = $initialfile
    $OpenFileDialog.ShowHelp = $true
    $OpenFileDialog.ShowDialog() | out-null
    $OpenFileDialog.filename
     
    }
     
    Function get-path-mp3 {
        $inputfilepath = Get-FileName -initialfile "mp3 (*.mp3)| *.mp3"
        $global:mp3_locaton = $inputfilepath 
    }
    Function get-path-image {
        $inputfilepath = Get-FileName -initialfile "jpg (*.jpg)| *.jpg"
        $global:image_locaton = $inputfilepath 
    }

    #[System.Windows.MessageBox]::Show('Step 1:: Plesae select the path for the Mp3 files , you can choose one file from the source folder and script can take all the mp3 files from that location')
    Add-Type -AssemblyName PresentationCore,PresentationFramework
    $msgBody = "Step 1:: Plesae select the path for the Mp3 files , you can choose one file from the source folder and script can take all the mp3 files from that location"
    [System.Windows.MessageBox]::Show($msgBody)
    get-path-mp3

    $msgBody = "Step 2:: Plesae select the path for the image file to use for Current batch of mp3 files"
    [System.Windows.MessageBox]::Show($msgBody)
    get-path-image


    Add-Type -AssemblyName System.Windows.Forms
    $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    $FolderBrowser.Description = 'Select the folder For Output video Mp4 files-- choose final destination folder'
    $result = $FolderBrowser.ShowDialog((New-Object System.Windows.Forms.Form -Property @{TopMost = $true }))
    if ($result -eq [Windows.Forms.DialogResult]::OK){
        $global:videp_mp4_locaton = $FolderBrowser.SelectedPath
    } else {
        exit
    }
    
    echo $global:mp3_locaton
    echo $global:image_locaton
    echo $global:videp_mp4_locaton

    $msgBody = "You have selected following:: Process all mp3 from followig location $global:mp3_locaton "+[Environment]::NewLine+ "IMAGE Location $global:image_locaton" + [Environment]::NewLine + "Mp4 video Output to following location $global:videp_mp4_locaton" + [Environment]::NewLine + "Are you sure you want to proceed? it will take longer time to proces all files."
    $msgTitle = "Conform Proceed"
    $msgButton = 'YesNoCancel'
    $msgImage = 'Question'
    $Result = [System.Windows.MessageBox]::Show($msgBody,$msgTitle,$msgButton,$msgImage)
    #Write-Host "The user chose: $Result [" ($result).value__ "]"
    If (($result).value__ -eq 6) {
        $mp3folder = Split-Path -Path  $global:mp3_locaton
        echo $mp3folder;
        $files = Get-ChildItem -Path $mp3folder -Recurse `
         | Where-Object {`
             $_.DirectoryName -notlike "*Other\Children" -and `
             $_.DirectoryName -notlike "*Other\Numbers" -and `
             $_.Extension -eq ".mp3"}
        # #Now loop through all the subfolders
        
        ForEach ($onefile in $files)
        {
            echo $onefile.Fullname;
            $mp3_full_path = $onefile.Fullname;
            $all_parts = ($onefile.Fullname).split("\")
            $file_only_name = $all_parts[(@($all_parts.Length - 1))]
            $file_only_name = $file_only_name.replace(' ','')
            $length = $file_only_name.Length;
            $file_only_name = $file_only_name.substring(0,$length-4);
            $mp4_out_locaton = "'"+$global:videp_mp4_locaton + "\$file_only_name.mp4'";
            $mp3_file_with_qut = "'"+$mp3_full_path + "'";
            $image_with_qt = "'"+$global:image_locaton + "'";
            $command_make_mp4 = "$ffmpeg_lib_location -loop 1 -i $image_with_qt -i $mp3_file_with_qut -c:a copy -c:v libx264 -shortest  -strict -1 $mp4_out_locaton"
            echo $command_make_mp4;
            iex "& $command_make_mp4";

        }
      
    }  