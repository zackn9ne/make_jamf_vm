#!/bin/bash
SN=$(python -c "import string; from random import randint, sample; print('VM' + ''.join(sample((string.ascii_uppercase + string.digits),10)))")

echo $SN
echo $SN
