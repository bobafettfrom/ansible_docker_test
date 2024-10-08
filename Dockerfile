FROM ubuntu:24.04
RUN apt update && apt install -y openssh-server sudo supervisor
RUN mkdir -p /run/sshd
RUN useradd -m -s /bin/bash -G sudo ansible && echo "ansible:123456" | sudo chpasswd
COPY supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]