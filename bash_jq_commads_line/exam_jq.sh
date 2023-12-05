#!/bin/bash

#==========================================================================================================================================================================================================
#Installation de  JQ
#==================================================================================================================================================================================================================
sudo apt  install -y jq  > /dev/null 2>&1
#===========================o===================================================================================================================================================================================

echo "1. Affichez le nombre d'attributs par document ainsi que l'attribut name. Combien y a-t-il d'attribut par document ? N'affichez que les 12 premières lignes avec la commande head"
cat people.json | jq .[] | jq '{name, count: length}' | head -n 12

echo "cat people.json | jq .[] | jq '{name, count: length}' | head -n 12"
echo "Réponse : il y a 17 attributs par document"
echo -e "\n---------------------------------\n"


#=================================================================================================================================================================================================================

echo "2. Combien y a-t-il de valeur "unknown" pour l'attribut "birth_year" ? Utilisez la commande tail afin d'isoler la réponse."
cat people.json | jq 'group_by(.birth_year)[] | {birth_year: .[0].birth_year, count: length}' | tail -n 4

echo "people.json | jq 'group_by(.birth_year)[] | {birth_year: .[0].birth_year, count: length}' | tail -n 4"
echo "Réponse : il y a  42 valeurs 'unknown' pour l'attribut 'birth_year'"
echo -e "\n---------------------------------\n"

#===================================================================================================================================================================================================================

echo "3. Affichez la date de création de chaque personnage et son nom. La date de création doit être de cette forme : l'année, le mois et le jour. N'affichez que les 10 premières lignes. (Pas de Réponse attendue)"
cat people.json | jq '.[:10] | .[] | {name, created: .created[0:10]}'

echo "Commande : cat people.json | jq '.[:10] | .[] | {name, created: .created[0:10]}'"
echo "Réponse : Pas de réponse attendue"
echo -e "\n---------------------------------\n"

#=====================================================================================================================================================================================================================

echo "4. Certains personnages sont nés en même temps. Retrouvez toutes les pairs d'ids (2 ids) des personnages nés en même temps."
cat people.json | jq 'group_by(.birth_year)[] | {id: .[0].id, name: .[].name, birth_year: .[0].birth_year , count: length}'|jq '. | select(.count==2)'

echo "cat people.json | jq 'group_by(.birth_year)[] | {id: .[0].id, name: .[].name, birth_year: .[0].birth_year , count: length}'|jq '. | select(.count==2)'"
echo "Réponse :  il y a six (6)  pairs  des personnages nés en même temps."
echo -e "\n---------------------------------\n"

#=====================================================================================================================================================================================================================

echo "5.Renvoyez le numéro du premier film dans lequel chaque personnage a été vu suivi du nom du personnage. N'affichez que les 10 premières lignes. (Pas de Réponse attendue)"
cat people.json | jq .[] | jq '{films: .films[], name}' | jq '. | select(.films == "http://swapi.co/api/films/1/")' | head -n 10

echo "Commande : cat people.json | jq .[] | jq '{films: .films[], name}' | jq '. | select(.films == "http://swapi.co/api/films/1/")' | head -n 10"
echo "Réponse : Pas de réponse attendue"
echo -e "\n---------------------------------\n"

#==============================================================================================================================================================================
#==========================Renvois de la sortie du script vers res_jq.txt=========================================================================================================
sleep 3
echo "`./exam_jq.sh > res_jq.txt`"

#==================================================================================================================================================================================
