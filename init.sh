sudo pip3 install gunicorn flask

sudo yum install -y yum-utils jq docker git libpcap-devel golang
sudo amazon-linux-extras install nginx1

sudo service docker start
sudo service nginx start

sudo chown -R ec2-user:ec2-user /usr/share/nginx/html
sudo chmod -R g+rw /usr/share/nginx/html; find /usr/share/nginx/html -type d -print0 | sudo xargs -0 chmod g+s

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

sudo wget https://github.com/mikefarah/yq/releases/download/v4.28.1/yq_linux_amd64 -O /usr/bin/yq
sudo chmod +x /usr/bin/yq

# sudo curl -SL https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
# sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

# wget https://raw.githubusercontent.com/scs-solution/scs-backend/master/docker-compose.yml
# mkdir config && cd conifg && touch database.db
# echo "CREATE SCHEMA IF NOT EXISTS scs;" >> database.db
# cd ..
# sudo docker-compose up -d

git clone https://github.com/scs-solution/scs-backend-host
cd scs-backend-host
sudo ./install.sh
sudo nohup ./run.sh &
cd ..

git clone https://github.com/scs-solution/scs-hooks
cd scs-hooks
sudo ./install.sh
sudo nohup ./run.sh &
sudo ./hooks-backend-ci.sh
cd ..

sudo pip3 install webssh
/usr/local/bin/wssh --origin='http://www.rollrat.com' &
