Install docker 
then run "docker build -t django-app ."
chech whether the build use sucessful by "sudo docker images"
at last run docker immage by 
docker run -d -p 8080:8080 django-app:latest

make sure that you port 8080 is open in SG.
