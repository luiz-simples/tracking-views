FROM rails:4.2
MAINTAINER Luiz Amorim <luiz.simples@gmail.com> (https://github.com/luiz-simples)

RUN echo "America/Sao_Paulo" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && apt-get upgrade -qqy --force-yes && apt-get dist-upgrade -qqy --force-yes
RUN apt-get install -qqy --force-yes apt-utils sudo libfontconfig1 bzip2 tar build-essential python-software-properties vim git curl locales
RUN apt-get autoremove -qqy --force-yes && apt-get autoclean -qqy --force-yes && apt-get clean && apt-get update

RUN echo "LANGUAGE=pt_BR.UTF-8" >> /etc/environment
RUN echo "LANG=pt_BR.UTF-8"     >> /etc/environment
RUN echo "LC_ALL=pt_BR.UTF-8"   >> /etc/environment
RUN locale-gen pt_BR.UTF-8
RUN dpkg-reconfigure locales

RUN echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    useradd -u 5001 -G users,sudo -d /rd --shell /bin/bash -m rd && \
    echo "secret\nsecret" | passwd rd

RUN chown -R rd:users /usr/local/bundle
RUN usermod -u 1000 rd
USER rd

WORKDIR /rd

CMD [ "bash" ]
