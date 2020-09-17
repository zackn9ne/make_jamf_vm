#!/bin/bash
SN=$(python -c "import string; from random import randint, sample; print('VM' + ''.join(sample((string.ascii_uppercase + string.digits),10)))")
INSTRUCTS="Browse to the folder containing your VM, Right Click, Show Package Contents, and drag the VMX File to this window."

echo ""
echo "**********************************************************"
echo "IMPORTANT: To use this script, shut down the VM first  !!!"
echo "IMPORTANT: To use this script, shut down the VM first  !!!"
echo "IMPORTANT: Don't just suspend it, either VMWARE menu   !!!"
echo "Shut Down, or apple menu Shut Down from inside the VM  !!!"
echo "**********************************************************"
echo ""

echo "Press enter if the VM is Shut Down and not just suspended."
read -p "Press enter to continue".
killall "VMware Fusion"

read -r -p "Do you want to open Default VM's Folder in finder to make this easier?" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    open ~/Virtual\ Machines.localized/
    echo $INSTRUCTS    
else
    echo $INSTRUCTS
fi

read VMXFILE

read -r -p "Your VMXFILE is $VMXFILE this OK? Make sure your terminal emulator escaped path slashes, iTerm usually messes this up, default Apple Terminal will be fine. [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    echo "proceeding to convert"
    sleep 1
    clear
else
    echo "Ok we are going to break and start over ok."
    exit 0
fi

read -r -p "Your getting ModelIdentifier MacBookPro15,1 is this OK? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    MODELIDENTIFIER="MacBookPro15,1"
else
    echo "Ok type in your own ModelIdentifier then maybe you like iMacPro1,1 as a hint:"
    read MODELIDENTIFIER
fi

read -r -p "Do you want fake Serial Number or your own [y/N] " response
    sleep 1
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    SN="$SN"
else
    echo "Ok type in your own serial:"
    read SN
fi
# Remove device specific crud

sed -i '' '/ethernet0.addressType/d' "$VMXFILE"
sed -i '' '/ethernet0.generatedAddress/d' "$VMXFILE"
sed -i '' '/ethernet0.generatedAddressOffset/d' "$VMXFILE"
sed -i '' '/uuid.bios/d' "$VMXFILE"
sed -i '' '/uuid.location/d' "$VMXFILE"
sed -i '' '/hw.model/d' "$VMXFILE"
sed -i '' '/serialNumber/d' "$VMXFILE"

# Do all the stuff
echo "hw.model = $MODELIDENTIFIER" >> "$VMXFILE"
echo "serialNumber = $SN" >> "$VMXFILE"

# Present End Screen
echo "*** Welcome to your new Mac ***"
echo "*******************************"
echo "*******************************"
echo "*******************************"
echo "*******************************"
echo "***" $MODELIDENTIFIER "************"
echo "***"  $SN "*************"
echo "*******************************"
echo "*******************************"

exit 0
