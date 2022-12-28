#Set creds
Initialize-AWSDefaultConfiguration -ProfileName <your_aws_profile_name>

#Get Nessus IP
$nessus = Get-Content .\ip_address_list.txt
$awsips = Get-EC2NetworkInterface | Select RequesterId,PrivateIpAddress,Description,{$_.Attachment.InstanceId}

#$awsips | Add-Member -MemberType NoteProperty -Name NessusIP -Value ""
#$awsips | Add-Member -MemberType NoteProperty -Name Matched -Value ""

$csv='"NessusIP","AWSIP","RequesterID","Description","InstanceId","Matched"' + "`r`n"

foreach ($ip in $nessus)
{
    $match = $awsips.PrivateIpAddress -contains $ip.Trim()
    $matched = 0
    foreach ($ipaws in $awsips)
    {
        if ($ipaws.PrivateIpAddress -contains $ip.Trim())
        {
            Write-host "Match ip $ip"
            $line = '"' + $ip + '","' + $ipaws.PrivateIpAddress + '","' + $ipaws.RequesterId + '","' + $ipaws.Description + '","' + $ipaws.'$_.Attachment.InstanceId' + '","TRUE"' + "`r`n"
  #          $line
            $matched = 1
        }
    }
    if ($matched){

    }else {
        Write-host "NO MATCH ip $ip"
        $line = '"' + $ip + '","","","","","FALSE"' + "`r`n"
 #       $line
    }

    $csv+=$line
     
}
$csv > .\exported_sheet.csv
