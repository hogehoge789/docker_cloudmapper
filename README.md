# docker_cloudmapper

docker build -t ubuntu-cloudmapper-img .  
docker run -d -p 80:8080 -e AWS_ACCESS_KEY_ID=xxx -e AWS_SECRET_ACCESS_KEY=xxx -e AWS_DEFAULT_REGION=ap-northeast-1 ubuntu-cloudmapper-img

