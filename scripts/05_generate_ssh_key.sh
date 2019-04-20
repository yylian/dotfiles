mkdir ~/.ssh
cd ~/.ssh

echo "Write your github mail adress\n"
read MAIL
echo ""

ssh-keygen -t rsa -b 4096 -C $MAIL

ssh-add -K ~/.ssh/id_rsa
eval "$(ssh-agent -s)"

echo "\n" >> ~/Desktop/finish.txt
cat ~/.ssh/id_rsa.pub >> ~/Desktop/finish.txt
