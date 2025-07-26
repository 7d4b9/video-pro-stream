
run
	xhost +local:root  # autorise le conteneur à utiliser l'affichage XQuartz
	docker-compose up --build