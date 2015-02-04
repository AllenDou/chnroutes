#!/bin/sh
python chnroutes.py -p linux
chmod +x ip-pre-up ip-down
mkdir /etc/ppp/ip-up.d
mkdir /etc/ppp/ip-down.d
mv ip-pre-up /etc/ppp/ip-up.d
mv ip-down /etc/ppp/ip-down.d
mv /etc/ppp/ip-up /etc/ppp/ip-up.bk
mv /etc/ppp/ip-down /etc/ppp/ip-down.bk
sed "/exit/"i\ "run-parts /etc/ppp/ip-up.d" /etc/ppp/ip-up.bk > /etc/ppp/ip-up
sed "/exit/"i\ "run-parts /etc/ppp/ip-down.d" /etc/ppp/ip-down.bk > /etc/ppp/ip-down
chmod +x /etc/ppp/ip-up /etc/ppp/ip-down

