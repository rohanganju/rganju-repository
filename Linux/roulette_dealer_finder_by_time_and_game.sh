#!/Bin/Bash
cat $1_Dealer_schedule | awk -F"\t" '{print $1, $3}' | grep -w "$2"
