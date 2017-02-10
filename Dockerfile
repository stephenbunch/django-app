FROM python:3.6.0

# libpq-dev: required for psycopg2
# openssh-server: required for ssh
# postgresql-client: required for `psql` command (postgres command line client)

RUN apt-get update && apt-get install -y \
  libpq-dev \
  openssh-server \
  postgresql-client

# ssh server requires this
RUN mkdir /var/run/sshd

# copy ssh key to virtual machine
COPY dev_rsa.pub /tmp
RUN mkdir -p /root/.ssh
RUN cat /tmp/dev_rsa.pub >> /root/.ssh/authorized_keys

# automatically cd into /code when ssh'ing into the virtual machine
RUN echo 'cd /code\n' >> /root/.bashrc

# copy python package list and install packages
COPY requirements.txt /code/
RUN pip install -r /code/requirements.txt

# run ssh server
CMD /usr/sbin/sshd -D
