SERVER=ubuntu@qortex.theplant-dev.com
SCRIPT=run_on_dev_for_editorpro.sh

scp ./scripts/$SCRIPT $SERVER:/home/ubuntu
ssh $SERVER "chmod +x /home/ubuntu/$SCRIPT && /home/ubuntu/$SCRIPT"