
minikube start --vm-driver=virtualbox ; minikube dashboard & minikube addons enable metallb

eval $(minikube docker-env)

# delete all .yaml
kubectl delete -f srcs/Nginx/nginx.yaml
kubectl delete -f srcs/mysql/mysql.yaml
kubectl delete -f srcs/phpmyadmin/php.yaml
kubectl delete -f srcs/Wordpress/wordpress.yaml
kubectl delete -f srcs/configmap.yaml

# ConfigMap
kubectl apply -f srcs/configmap.yaml

# Nginx
kubectl delete -f srcs/Nginx/nginx.yaml
docker build -t nginx_image srcs/Nginx/
kubectl apply -f srcs/Nginx/nginx.yaml

# Ftps
kubectl delete -f srcs/Ftps/ftps.yaml
docker build -t ftps_image srcs/Ftps/
kubectl apply -f srcs/Ftps/ftps.yaml

# MySQL
kubectl delete -f srcs/mysql/mysql.yaml
docker build -t mysql_image srcs/mysql/
kubectl apply -f srcs/mysql/mysql.yaml

# PhpMyAdmin
kubectl delete -f srcs/phpmyadmin/php.yaml
docker build -t php_image srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/php.yaml

# Wordpress
kubectl delete -f srcs/Wordpress/wordpress.yaml
docker build -t wp_image srcs/Wordpress/
kubectl apply -f srcs/Wordpress/wordpress.yaml


# Grafana
kubectl delete -f srcs/Grafana/grafana.yaml
docker build -t grafana_image srcs/Grafana/
kubectl apply -f srcs/Grafana/grafana.yaml

# InfluxDB
kubectl delete -f srcs/InfluxDB/influxdb.yaml
docker build -t influxdb_image srcs/InfluxDB/
kubectl apply -f srcs/InfluxDB/influxdb.yaml


ls;