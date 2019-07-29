FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y wget gnupg2 curl gawk
# git-secret specific no things should add between them
RUN echo "deb https://dl.bintray.com/sobolevn/deb git-secret main" >> /etc/apt/sources.list
RUN wget -qO - https://api.bintray.com/users/sobolevn/keys/gpg/public.key | apt-key add -
# git-secret specific no things should add between them
RUN curl https://deb.nodesource.com/setup_10.x | /bin/bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN apt-get -y install python3 ansible nodejs yarn
RUN apt-get -y update
RUN apt-get -y upgrade
RUN mkdir /app
WORKDIR /app
COPY . /app/
RUN ansible-playbook playbook.yml