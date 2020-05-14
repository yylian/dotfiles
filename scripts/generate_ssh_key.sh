mkdir ~/.ssh
cd ~/.ssh

echo "Write the mail adress for your ssh-key\n"
read MAIL
echo ""

ssh-keygen -t rsa -b 4096 -C $MAIL

ssh-add -K ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
