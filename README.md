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

If you don't have `git` installed on your ubuntu OS, run

```shell
  apt update && apt install -y git
```

The script additionally checks if the dependencies are already installed.
In case they are not, it installs them, otherwise it prints a message that they are already installed.
