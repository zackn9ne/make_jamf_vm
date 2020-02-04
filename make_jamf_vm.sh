#!/bin/bash
SN=$(python -c "import string; from random import randint, sample; print('VM' + ''.join(sample((string.ascii_uppercase + string.digits),10)))")

echo ""
echo "**********************************************************"
echo "IMPORTANT: To use this script, quit VMware Fusion first!!!"
echo "**********************************************************"
echo ""

echo "*** Shutdown your VM's and Quit VMWARE ***"
read -p "Press enter to continue".
echo "fake Serial Number, will be:" $SN

echo "*** We are about to pop up your finder window of the default VMWare VM's location so you can do this easier"
echo "**** Drag the VMX file to the whitespace here and press [enter] when done ****"
open ~/Virtual\ Machines.localized/
read VMXFILE

read -r -p "Your getting ModelIdentifier MacBookPro15,1 is this OK? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    MODELIDENTIFIER="MacBookPro15,1"
else
    echo "Ok type in your own ModelIdentifier then maybe you like iMacPro1,1 as a hint:"
    read MODELIDENTIFIER
fi


# Remove device specific crud

sed -i '' '/ethernet0.addressType/d' "$VMXFILE"
sed -i '' '/ethernet0.generatedAddress/d' "$VMXFILE"
sed -i '' '/ethernet0.generatedAddressOffset/d' "$VMXFILE"
sed -i '' '/uuid.bios/d' "$VMXFILE"
sed -i '' '/uuid.location/d' "$VMXFILE"
sed -i '' '/hw.model/d' "$VMXFILE"
sed -i '' '/serialNumber/d' "$VMXFILE"

# Add Model Identifier and Serial Number

echo "*** Welcome to your new Mac ***"
echo "hw.model" $MODELIDENTIFIER
echo "*******************************"
echo "*******************************"
echo "*******************************"
echo "*******************************"
echo "serialNumber" $SN 
echo "*******************************"
echo "***** zackn9ne made it ********"

exit 0
