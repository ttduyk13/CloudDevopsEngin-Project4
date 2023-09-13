# Template:
[![<ttduyk13>](https://circleci.com/gh/ttduyk13/CloudDevopsEngin-Project4.svg?style=svg)](https://circleci.com/gh/ttduyk13/CloudDevopsEngin-Project4/?branch=main)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup repository
1. Create a new public repository with name CloudDevopsEngin-Project4
2. Clone this repository to my local
3. Copy git clone https://github.com/udacity/DevOps_Microservices.git for get the template project
4. cp DevOps_Microservices/project-ml-microservice-kubernetes into CloudDevopsEngin-Project4 repository

## Setup the Environment

[I. Setup python](#setup-python)
1. install pyenv:
```
curl https://pyenv.run | bash
```

2. Add pyenv into ~/.bashrc
```
# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
```
3. Restart shell
```
exec $SHELL
```
4. Install Python 3.7 (in this case I will use version 3.7.3)
```
pyenv install 3.7.3
```

[II. Setup local environment](#setup-local-environment)
```
# setup local env
make setup
source ~/.devops/bin/activate
make install

# install hadolint
sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64
sudo chmod +x /bin/hadolint

# Run lint checks
make lint
```

[III. Setup kubectl and minikube](#setup-kubectl-minikube)
1. Install kubectl: [link](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
2. Install minikube: [link](https://kubernetes.io/vi/docs/tasks/tools/install-minikube/#c%C3%A0i-%C4%91%E1%BA%B7t-minikube-th%C3%B4ng-qua-t%E1%BA%A3i-xu%E1%BB%91ng-tr%E1%BB%B1c-ti%E1%BA%BFp)
3. Verify kubectl and minikube
```
kubectl version
minikube version
```

[IV. Docker steps](#docker_steps)

1. Complete Dockerfile

This file will include list of instructions to build a Docker image for application

2. Complete run_docker.sh and run it to build a image

This script will build image with tag and run flask app inside a container with exposing port 80 to 8000

3. Complete upload_docker.sh and run it to upload image

This script will login into docker, then tag and push it into my docker hub [here](https://hub.docker.com/repository/docker/leok13/duytt10-clouddevopsengin-project4/general)

[IV. Kubernetes steps](#kubernetes_steps)
1. Start minikube to create a cluster in local

```minikube start```

2. Complete run_kubernetes.sh

This script will deploy docker image and run it with fixed port then it will forward container port to a host for outbound


[V. Setup CircleCI](#setup_circleci)
1. Connect repo to CircleCI [guide](https://circleci.com/docs/getting-started/)
2. Copy config.yml from support material [file](https://video.udacity-data.com/topher/2019/May/5cda234b_config/config.yml)
3. Commit code to run pipeline
4. Add status bagde from [link](https://circleci.com/docs/2.0/status-badges/)