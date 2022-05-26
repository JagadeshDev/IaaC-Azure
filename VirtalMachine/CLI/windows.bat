@REM Create ResourceGroup
New-AzResourceGroup -Name myResourceGroup -Location 'EastUS'

New-AzVm `
    -ResourceGroupName 'myResourceGroup' `
    -Name 'myVM' `
    -Location 'East US' `
    -VirtualNetworkName 'myVnet' `
    -SubnetName 'mySubnet' `
    -SecurityGroupName 'myNetworkSecurityGroup' `
    -PublicIpAddressName 'myPublicIpAddress' `
    -OpenPorts 80,3389

Get-AzPublicIpAddress -ResourceGroupName 'myResourceGroup' | Select-Object -Property  'IpAddress'

mstsc /v:publicIpAddress

@REM Run on newly created VM in powershell
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

@REM Clean up the resources
Remove-AzResourceGroup -Name myResourceGroup