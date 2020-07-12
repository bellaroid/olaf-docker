# Olaf Docker

## Setup

- Run `cp olaf.env.dist olaf.env`
- Edit `olaf.env` if you want to
- Run `docker-compose up`; once the logs display the message **System Ready** you should be able to access Olaf's web server (by default on `http://127.0.0.1:5000`)

## Development

In order to run the shell or have control over the Olaf service (starting it and stopping it at will), you may do the following:
- Run `docker-compose down` to stop and remove all running services
- Run `docker-compose run --entrypoint="/bin/bash" --service-ports olaf`
- Once inside the container, just run `python olaf-bin.py` to start the shell with `python -i shell.py`