FROM ubuntu:latest

RUN apt-get update && apt-get install -y firefox && rm -rf /var/cache/apt/

# NOTE: REPLACE 501/20 with your user id /group id -- which you can find on your mac via:
#   id -u;
#   id -g;
RUN export uid=501 gid=20 && \
mkdir -p /home/developer && \
mkdir -p /etc/sudoers.d && \
echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
echo "developer:x:${uid}:" >> /etc/group && \
echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
chmod 0440 /etc/sudoers.d/developer && \
chown ${uid}:${gid} -R /home/developer
