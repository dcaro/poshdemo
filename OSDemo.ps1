# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

# This script demonstrate PowerShell on Linux 
 
# List files
Get-ChildItem 
Get-ChildItem -Depth 2 
ls 

# List process
Get-Process
Get-Process | Where-Object { $_.processName -match  'Chrome' }

# Date 
Get-Date 
