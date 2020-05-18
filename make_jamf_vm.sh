#!/bin/bash
SN=$(python -c "import string; from random import randint, sample; print('VM' + ''.join(sample((string.ascii_uppercase + string.digits),10)))")

echo ""
echo "**********************************************************"
echo "IMPORTANT: To use this script, quit VMware Fusion first!!!"
echo "**********************************************************"
echo ""

echo "Select Shut Down from the VM you are cloning before running this."
read -p "Press enter to continue".
killall "VMware Fusion"

read -r -p "Do you want to open Default VM's Folder in finder to make this easier?" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    open ~/Virtual\ Machines.localized/
else
    echo "Browse to the folder containing your VM, Right Click, Show Package Contents, and drag the VMX File to this window."
fi
read VMXFILE

read -r -p "Your getting ModelIdentifier MacBookPro15,1 is this OK? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    MODELIDENTIFIER="MacBookPro15,1"
else
    echo "Ok type in your own ModelIdentifier then maybe you like iMacPro1,1 as a hint:"
    read MODELIDENTIFIER
fi

read -r -p "Do you want fake Serial Number or your own [y/N] " response
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
