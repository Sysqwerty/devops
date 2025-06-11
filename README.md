## This is an example of the shell script that installs:

- Docker
- Docker compose
- Python 3.9
- Django

# Steps:

1. Make sure you are using ubuntu OS
2. Clone the repo, checkout branch `lesson-3`
3. Run `chmod +x install_dev_tools.sh` to make the script executable
4. Run and execute the script `./install_dev_tools.sh`

```shell
./install_dev_tools.sh
```

If you don't have git installed on your ubuntu OS, run

```shell
apt-get install git
```

The script additionally checks if the dependencies are already installed.
In case they are not, it installs them, otherwise it prints a message that they are already installed.
