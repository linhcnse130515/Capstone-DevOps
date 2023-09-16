## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.devops
	source ~/.devops/bin/activate

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r app/requirements.txt

	# chmod +x
	sudo chmod +x bin/install_hadolint.sh
	sudo chmod +x bin/install_kubectl.sh
	sudo chmod +x bin/run_docker.sh
	sudo chmod +x bin/upload_docker.sh
	sudo chmod +x bin/k8s_deployment.sh
	sudo chmod +x bin/k8s_green_deployment.sh
	sudo chmod +x bin/install_eksctl.sh
	sudo chmod +x bin/eks_create_cluster.sh

	# install kubectl, hadolint, eksctl
	./bin/install_hadolint.sh
	./bin/install_kubectl.sh
	./bin/install_eksctl.sh
	
build-docker:
	./bin/run_docker.sh
	
upload_docker:
	./bin/upload_docker.sh

k8s-deployment:
	./bin/k8s_deployment.sh

k8s_green_deployment:
	./bin/k8s_green_deployment.sh
	
test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint app/Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app/app.py

all: install lint test
