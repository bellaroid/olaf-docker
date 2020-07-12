FROM python:3.8.3-alpine

USER root

RUN apk add git

COPY ./entrypoint.sh /entrypoint.sh
COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt
RUN mkdir /opt/olaf
RUN chown daemon:daemon /opt/olaf

USER daemon
CMD [ "python /opt/olaf/olaf-bin.py" ]