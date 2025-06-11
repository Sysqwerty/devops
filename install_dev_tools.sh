#!/bin/sh
sudo apt-get update

# install docker
if ! which docker &> /dev/null; then
  sudo apt-get install \
      ca-certificates \
      curl \
      gnupg \
      lsb-release
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io
  else
    echo "Docker is already installed"
fi

# install docker compose
if ! which docker-compose &> /dev/null; then
  sudo apt-get install docker-compose
  else
    echo "Docker compose is already installed"
fi

# install python 3.9
if ! which python3.9 &> /dev/null; then
  sudo apt-get install python3.9
  else
    echo "Python 3.9 is already installed"
fi

# install django
if ! which django-admin &> /dev/null; then
  pip install django
  else
    echo "Django is already installed"
fi

# install git
if ! which git &> /dev/null; then
  sudo apt-get install git
  else
    echo "Git is already installed"
fi