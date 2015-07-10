$csv_path = "g:\scripts\csv\branches.csv"
$csv_import = Import-CSV $csv_path
 
ForEach ($item in $csv_import)
{
	$SiteServer = "SCCM1"
	$DomainName = ".mhc.trk"
	$DPServerName = $item.Name
	$DPServerName = $DPServerName + $DomainName
	$DPSiteCode = "MHC"
	#$BoundaryName = $item.BoundaryName
	#$BoundaryType = $item.BoundaryType
	#$BoundaryValue = $item.BoundaryValue
	write-host $DPServerName 

	#New-CMSiteSystemServer -ServerName $DPServerName -SiteCode $DPSiteCode
	#Add-CMSoftwareUpdatePoint -SiteCode $DPSiteCode -SiteSystemServerName $DPServerName -ClientConnectionType Intranet -WsusiisPort 8530
	#Set-CMSoftwareUpdatePoint -SiteCode $DPSiteCode -SiteSystemServerName $DPServerName -ClientConnectionType Intranet -WsusiisPort 8530 -WsusAccessAccount "MHC_#10\SCCMAdmin" 
	#New-CMBoundaryGroup -Name $DPServerName -DefaultSiteCode $DPSiteCode -Description $DPServerName
	#Add-CMBoundaryToGroup -BoundaryGroupName $DPServerName -BoundaryName $BoundaryName
	#Example 1
	#$Flag = 0 # 0 - Fast Connection, 1 -  Slow Connection
	#$NALPath = "[""Display=\\" +  $DPServerName + $DomainName + "\""]MSWNET:[""SMS_SITE=" + $DPSiteCode + """]\\" + $DPServerName + $DomainName + "\"
	#$BoundaryGroupQuery = Get-WmiObject -Namespace "ROOT\sms\site_MHC" -Class SMS_BoundaryGroup -ComputerName SCCM1 -Filter "Name = '$DPServerName'"
	#$BoundaryGroupQuery.AddSiteSystem($NALPath,$Flag)
	#Write-Host "Press any key to continue ..."
	#$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

	G:\scripts\ps\Configure-RemoteDP.ps1 -ServerName $DPServerName -SiteCode MHC
}