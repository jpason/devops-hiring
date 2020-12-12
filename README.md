Local development
========================

First, copy `devops-hiring.settings` file to your `$HOME` and fill in `SECRET_KEY` and `DB_PASS` with some random strings. Values from that file are used by scripts, to configure application.

Application is configured to use PostgreSQL (tested with v.10). 

* Install PostgreSQL
* Use provided `prepare_db.sh` script to create database and grant permissions.
* Alternatively, PostgreSQL can be deployed in AWS, using provided terraform file, as well.

Build docker image using provided Dockerfile.

`docker build -t devops-hiring .`

Run it with provided `run_local.sh` script. Before the application can be used, database must be populated and admin user created. Do it with provided `initialize.sh` script. After that, the application can be reached on port 8000.


Kubernetes
=========================


Only deployment on minikube with docker driver was tested. Use files from `minikube` directory. Secrets encrypted with SOPS are provided as a proof-of-concept, how to securely keep secrets in Git.  

eval $(minikube docker-env) 
docker build -t devops-hiring .
sops -d secrets.sops.yaml|kubectl apply -f -
kubectl apply -f deployment.yaml


Terraform
==========================
In `terraform` directory there are files to deploy auxillary resources in AWS (database for Django and KMS for SOPS).

