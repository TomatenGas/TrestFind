JMENO=$1
ADR=/home/zlocinci.txt
celeJMENO=`grep "^[^;]*;[^;]*$1[^;]*;.*" $ADR | cut -d";" -f2 | sort -u | tr '\n' ',' | sed 's/,$//'`
pocetZAZN=`grep "$JMENO" $ADR | cut -d";" -f2 | sort -u | wc -l`
prvniZAZN=`grep "$JMENO" $ADR | cut -d";" -f5 | sort -t"." -k3 -n | head -n1`
posledniZAZN=`grep "$JMENO" $ADR | cut -d";" -f5 | sort -t"." -k1 -ns | sort -t"." -k2 -ns | sort -t"." -k3 -ns | tail -n1`
pocetZLOCINU=`grep "$JMENO" $ADR | wc -l`
TYPY=`grep "$JMENO" $ADR | cut -d";" -f4 | tr ',' '\n' | sort -u | tr '\n' ',' | sed 's/,$//'`
nejZLOCIN=`grep "$JMENO" $ADR | cut  -d";" -f3,6 | sort -t";" -k2 -n | tail -n1 | sed 's/;/ - /'`

if test $pocetZAZN -eq 1; then
    echo $celeJMENO
    echo "----------------------------"
    echo "TrestnĂ­ kariĂ©ra: " $prvniZAZN "-" $posledniZAZN
    echo "SpĂˇchal zloÄŤinĹŻ: " $pocetZLOCINU
    echo "VĹˇechny prĂˇvnĂ­ klasifikace: " $TYPY
    echo "NejzĂˇvaĹľnÄ›jĹˇĂ­ zloÄŤin: " $nejZLOCIN
elif test $pocetZAZN -eq 0; then
    echo "NenĂ­ tu ĹľĂˇdnĂ˝ zĂˇznam"
else
    echo "ZadĂˇnĂ­ nenĂ­ jednoznaÄŤnĂ©: " $celeJMENO
fi