# Make Jamf VM
Jamf Pro & VMWare Fusion living in harmony

# What does this do
* Generates a random serial number or you can set one and Device ID so you can clone macOS VM's and not have them clash in a JAMF Pro Install

# What problem does this solve?
* Make one macOS VM and user initiated install it ✅
* Clone that macOS VM and try to user initiated enroll it into Jamf Pro ❌ it will trip over the serial number and fail

## Dependancies
1. you need VMWare Fusion and macOS
2. make an macOS VM I forget how I did this but you can google it
3. Be able to browse to where your VM's are located and "Show Package Contents" able to find the `.vmx` file 

## How To Use
* `git clone https://github.com/zackn9ne/make_jamf_vm.git && cd make_jamf_vm`
* `sh make_jamfvm.sh` it will prompt you for stuff, there are no arguments.
* Load that VM you just blessed in VMWARE, and now you can enroll it in JAMF without problems
