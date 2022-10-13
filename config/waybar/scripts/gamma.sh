if [[ ! `pidof gammastep` ]]; then
	gammastep -PO 4500
else
	pkill gammastep
fi