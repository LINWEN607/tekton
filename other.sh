#harbor账号密码
kubectl create secret generic docker-credentials -n cicd --from-file=config.json=/root/.docker/config.json


#容器空间kubectl准行
kubectl create secret generic kubernetes-config --from-file=/root/.kube/config


#gitlab ssh密钥  id_rsa known_hosts   
kubectl create secret generic git-credentials -n cicd  --from-file=id_rsa=~/.ssh/id_rsa  --from-file=known_hosts=~/.ssh/known_hosts







kubectl create secret docker-registry dockerhub --docker-server=https://index.docker.io/v1/ --docker-username=[USERNAME] --docker-password=[PASSWORD] --dry-run=client -o json | jq -r '.data.".dockerconfigjson"' | base64 -d > /tmp/config.json && kubectl create secret generic docker-config --from-file=/tmp/config.json && rm -f /tmp/config.json
