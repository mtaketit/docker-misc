### Official Page
[Docker Engine Install](https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine)

```console
$ sudo apt-get remove docker docker-engine docker.io containerd runc
```


#### Set up the repository

1.  Update the `apt` package index and install packages to allow `apt` to use a
    repository over HTTPS:

    ```console
    $ sudo apt-get update

    $ sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    ```

2.  Add Docker's official GPG key:

    ```console
    $ sudo mkdir -p /etc/apt/keyrings
    $ curl -fsSL {{ download-url-base }}/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    ```

3.  Use the following command to set up the repository:

    ```console
    $ echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] {{ download-url-base }} \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```

#### Install Docker Engine

1. Update the `apt` package index, and install the _latest version_ of Docker
   Engine, containerd, and Docker Compose, or go to the next step to install a specific version:

    ```console
    $ sudo apt-get update
    $ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    ```

    > Receiving a GPG error when running `apt-get update`?
    >  
    > Your default umask may not be set correctly, causing the public key file
    > for the repo to not be detected. Run the following command and then try to
    > update your repo again: `sudo chmod a+r /etc/apt/keyrings/docker.gpg`.

2.  To install a _specific version_ of Docker Engine, list the available versions
    in the repo, then select and install:

    a. List the versions available in your repo:

    ```console
    $ apt-cache madison docker-ce

    docker-ce | 5:20.10.16~3-0~ubuntu-jammy | https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages
    docker-ce | 5:20.10.15~3-0~ubuntu-jammy | https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages
    docker-ce | 5:20.10.14~3-0~ubuntu-jammy | https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages
    docker-ce | 5:20.10.13~3-0~ubuntu-jammy | https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages
    ```

    b. Install a specific version using the version string from the second column,
       for example, `5:20.10.16~3-0~ubuntu-jammy`.

    ```console
    $ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io docker-compose-plugin
    ```

3.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.

    ```console
    $ sudo docker run hello-world
    ```

    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
