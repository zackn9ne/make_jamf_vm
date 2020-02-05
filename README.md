# Make Jamf VM
Jamf Pro & VMWare Fusion living in harmony

# What does this do
* Generates a random serial number or you can set one 
* Generates a Device ID or you can choose one

# What problem does this solve?
* You can clone macOS VM's and not have them fail a JAMF Pro Install
* Make one macOS VM and user initiated install it ✅
* Clone that macOS VM and try to user initiated enroll it into Jamf Pro ❌ it will trip over the serial number and fail

## Dependencies
1. VMWare Fusion and macOS
2. make an macOS VM I forget how I did this but you can google it
3. Browse to where your VM's are located and "Show Package Contents" able to find the `.vmx` file 

## How To Use
* `git clone https://github.com/zackn9ne/make_jamf_vm.git && cd make_jamf_vm`
* `sh make_jamfvm.sh` it will prompt you for stuff, there are no arguments.
* Open said VM you just blessed in VMWARE, and now you can enroll it in JAMF without problems

## Troubleshooting
* If you have a failed enroll you have to go to the Devices tab in JamfPro and clear out the Device by deleting it, it thinks it was an Device, Not a Computer, I know
* Restart your macOS VM in case you had it suspended when you altered its Device ID and Serial Number
