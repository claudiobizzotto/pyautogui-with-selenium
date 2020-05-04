FROM selenium/node-chrome:3.141.59-20200409

USER root
RUN apt update
RUN apt install -y python3 python3-pip
RUN apt install -y python3-xlib python3-tk python3-dev # PyAutoGUI requirements
RUN apt install -y xvfb xserver-xephyr # Monkey-patch PyAutoGUI internals
RUN pip3 install virtualenv

ARG SELENIUM_ARTIFACTS_DIR="/ilovemepaws/artifacts"
RUN mkdir -p $SELENIUM_ARTIFACTS_DIR
RUN chown -R seluser:seluser $SELENIUM_ARTIFACTS_DIR
RUN chmod 755 $SELENIUM_ARTIFACTS_DIR

WORKDIR /ilovemepaws
RUN chown -R seluser:seluser /ilovemepaws
RUN chmod 755 /ilovemepaws

USER seluser

COPY requirements.txt .
COPY ilovemepaws .

RUN virtualenv .venv
RUN /bin/bash -c "source .venv/bin/activate"
RUN pip3 install -r requirements.txt

ENV PATH="/ilovemepaws:${PATH}"
ENV SELENIUM_ARTIFACTS_DIR $SELENIUM_ARTIFACTS_DIR
