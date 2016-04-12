function addhost() {
    HOSTNAME=$1
    IP=$2
    HOSTS_LINE="$IP\t$HOSTNAME"
    if [ -n "$(grep $HOSTNAME /etc/hosts)" ]; then
        echo "$IP already exists at $HOSTNAME"
    else
        echo "Adding $HOSTNAME to your $ETC_HOSTS";
        sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts";

        if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
            then
                echo "$HOSTNAME was added succesfully \n $(grep $HOSTNAME /etc/hosts)";
            else
                echo "Failed to Add $HOSTNAME, Try again!";
        fi
    fi
}

addhost 10.0.1.221 yogi
addhost 10.0.1.222 booboo
addhost 10.0.1.202 tv
