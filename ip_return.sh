#!/bin/bash
# programme affichant l'ip d'un raspBerry sur une led branchée à la broche18 (GPIO)
# écrit par martin laporte le 9 decembre 2015

#je suis su, je configure le numéro de broche
sudo echo "18" > /sys/class/gpio/export
#je configure la pin en output
sudo echo "out" > /sys/class/gpio/gpio18/direction

#StartShortBlink T=0.4s
sudo echo "1" > /sys/class/gpio/gpio18/value
sleep 0.2 
sudo echo "0" > /sys/class/gpio/gpio18/value
sleep 2

#récupération de l'IP en utilisateur normal
/sbin/ifconfig eth0|grep adr:| awk '{printf $2}'|grep -o [0-9] >IP
#récupération du nombre de caractères de l'IP
Nbchiffre=$(/sbin/ifconfig eth0|grep adr:| awk '{printf $2}'|grep -o [0-9]|wc -l)

#ShortBlink T=1s
sudo echo "2" > /sys/class/gpio/gpio18/value
sleep 0.2
sudo echo "0" > /sys/class/gpio/gpio18/value
sleep 2

# emission chiffre par chiffre en partant de la fin
for(( Nbchiffre=$Nbchiffre ; Nbchiffre>0 ; Nbchiffre-- ));
do
	#récupère le chiffre

	chiffre=$(head -n$Nbchiffre IP|tail -1)
	echo $chiffre
	for  (( chiffre>0 ; chiffre>0 ; chiffre--));
	do
		#ShortBlink T=1s
		sudo echo "1" > /sys/class/gpio/gpio18/value
		sleep 0.5
		sudo echo "0" > /sys/class/gpio/gpio18/value
		sleep 0.5
	done
    #LongBlink T=4s
	  sudo echo "1" > /sys/class/gpio/gpio18/value
    sleep 2
    sudo echo "0" > /sys/class/gpio/gpio18/value
    sleep 2

done
exit 1
