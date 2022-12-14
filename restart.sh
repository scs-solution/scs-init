sudo systemctl start docker.service
sudo docker start $(sudo docker ps -aq)
cd scs-backend-host
sudo nohup ./run.sh &
cd ../scs-hooks
sudo nohup ./run.sh &
/usr/local/bin/wssh  --origin='http://www.rollrat.com' &
sudo service nginx restart
