#select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System inner join SMS_G_System_COMPUTER_SYSTEM on SMS_G_System_COMPUTER_SYSTEM.ResourceId = SMS_R_System.ResourceId where SMS_G_System_COMPUTER_SYSTEM.Name like "B20%" or SMS_G_System_COMPUTER_SYSTEM.Name like "B0020%"

$csv_path = "C:\scripts\branches.csv"
$csv_import = Import-CSV $csv_path

foreach ($item in $csv_import)
{
	$CollectionName = $item.Name
	$QueryName1 = $CollectionName.Substring(0,$CollectionName.Length-2)
	$QueryName2 = 'B00' + $CollectionName.Substring(1,$CollectionName.Length-3)
	$Query = 'select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System inner join SMS_G_System_COMPUTER_SYSTEM on SMS_G_System_COMPUTER_SYSTEM.ResourceId = SMS_R_System.ResourceId where SMS_G_System_COMPUTER_SYSTEM.Name like "' + $QueryName1 + '%" or SMS_G_System_COMPUTER_SYSTEM.Name like "' + $QueryName2 + '%"'
	#Write-Host $CollectionName
	#Write-Host $QueryName1
	#Write-Host $QueryName2	
	
	New-CMDeviceCollection -LimitingCollectionName "All Systems" -Name $CollectionName -RefreshType Both 
	Add-CMDeviceCollectionQueryMembershipRule -CollectionName $CollectionName -QueryExpression $Query -RuleName $QueryName1
}
