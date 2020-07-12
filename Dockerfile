FROM python:3.8.3-buster

USER root

# Install Dependencies
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
RUN apt-get update && apt-get install -y git mongodb-org-shell

# Remove APT caché
RUN apt-get clean autoclean
RUN apt-get autoremove --yes
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/

# Get Olaf
RUN mkdir /opt/olaf
RUN git clone https://github.com/bellaroid/olaf /opt/olaf
RUN pip install -r /opt/olaf/requirements.txt

# Copy Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

# Change user and workdir, set entrypoint
USER daemon
WORKDIR /opt/olaf
ENTRYPOINT ["/entrypoint.sh"]