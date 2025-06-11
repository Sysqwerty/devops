## This is an example of the shell script that installs:

- Docker
- Docker compose
- Python 3.9
- Django

# Steps:

1. Make sure you are using ubuntu OS and the `root` user
2. Clone the repo
3. Checkout branch `lesson-3`
4. Make the script executable

```shell
  chmod u+x install_dev_tools.sh
```

4. Execute the script

```shell
  ./install_dev_tools.sh
```

5. Run the script second time to check if the dependencies are already installed

```
Reading package lists... Done
/usr/bin/docker
Docker is already installed
/usr/bin/docker-compose
Docker compose is already installed
/usr/bin/python3
Python 3.9 is already installed
/usr/local/bin/pip3
pip for Python 3.9 is already installed
/usr/local/bin/django-admin
Django is already installed
```

If you don't have `git` installed on your ubuntu OS, run

```shell
  apt update && apt install -y git
```

The script additionally checks if the dependencies are already installed.
In case they are not, it installs them, otherwise it prints a message that they are already installed.

## A Tip

If you don't have an Ubuntu OS, you can use the [Docker Desktop](https://www.docker.com/products/docker-desktop/) to install the dependencies.

Just run the next commands one by one

```shell
docker run -it --name=ubuntu ubuntu:22.04
apt update && apt install -y git
git clone https://github.com/Sysqwerty/devops.git
cd devops
git checkout lesson-3
chmod u+x install_dev_tools.sh
./install_dev_tools.sh
```
