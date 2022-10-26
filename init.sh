sudo pip3 install gunicorn flask

sudo yum install -y yum-utils jq docker git

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

sudo wget https://github.com/mikefarah/yq/releases/download/v4.28.1/yq_linux_amd64 -O /usr/bin/yq
sudo chmod +x /usr/bin/yq

sudo curl -SL https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

wget https://raw.githubusercontent.com/scs-solution/scs-backend/master/docker-compose.yml
mkdir config && cd conifg && touch database.db
echo "CREATE SCHEMA IF NOT EXISTS scs;" >> database.db
cd ..
sudo docker-compose up -d
