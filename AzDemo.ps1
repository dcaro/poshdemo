# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

# This script demonstrate how to work with Azure and PowerShell

# Preparation steps to saves some time
## Install Azure module 
Install-Module -Name Az -Repository PSGallery -Force

## Install Azure account in preview for the simplifier
Install-Module -Name Az.Accounts -AllowPrerelease -Repository PSGallery -Force

# Authenticate to Azure
## Connect to Azure with the account
Connect-AzAccount 
## Note that the browser is launching automatically and allows MFA in a much smoother experience that when using the device login.

## If the default subscription in not the correct azure subscriptions 

Get-AzContext -ListAvailable | fl 
Get-AzContext -Name "Azure DevEx Demos (xxxxxxxxxxxxx) - dcaro@microsoft.com" | Select-AzContext
## Change the string above with the proper value.

# Interact with resources in Azure 
## Create a resource group 
$location = "southeastasia"
$sufix = -join ((48..57) + (97..122) | Get-Random -Count 4 | % {[char]$_})
$rgname = "demogroup-$sufix"
New-AzResourceGroup -Name $rgname -Location $location

## Get the Resource group as an object 
Get-AzResourceGroup -Name $rgname

## Create a new Windows VM in the newly created resource group
New-AzVm `
    -ResourceGroupName $rgname -Name "VM$sufix" -Location $location -VirtualNetworkName "Vnet-$sufix" `
    -SubnetName "Subnet-$sufix" -SecurityGroupName "NSG-$sufix" -PublicIpAddressName "PublicIpAddress-$sufix" -OpenPorts 80,3389

