#!/bin/bash
#deploy_remote.sh

#Je mets la chaine de connexion de ma machine distance dans une variable
MACHINE_DESTINATION="ec2-user@ec2-3-22-250-36.us-east-2.compute.amazonaws.com"
PATH_SECRET_KEY="/secrets/kp-alison.pem"

#On crée le répertoire /app sur la machine distante
ssh -o StrictHostKeyChecking=no -i $PATH_SECRET_KEY $MACHINE_DESTINATION 'sudo mkdir -p /app && sudo chmod -R 777 /app && sudo chown ec2-user /app'

#On copie le fichier .class dans le dossier homedir de l'utilisateur (car on n'arrive pas à l'envoyer directement sur /app)
#possible de faire dans un dossier temporaire 
scp -o StrictHostKeyChecking=no -i $PATH_SECRET_KEY helloWorld.class $MACHINE_DESTINATION:/home/ec2-user/helloWorld.class

#On copie le fichier .class dans le dossier /app localement 
ssh -o StrictHostKeyChecking=no -i $PATH_SECRET_KEY $MACHINE_DESTINATION 'sudo cp /home/ec2-user/helloWorld.class /app'

#On execute le fichier helloWorld.class
ssh -o StrictHostKeyChecking=no -i $PATH_SECRET_KEY $MACHINE_DESTINATION 'sudo cd /app && sudo java helloWorld'
