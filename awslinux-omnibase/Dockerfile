FROM amazonlinux

RUN cd /root
RUN touch .bash_profile

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
RUN nvm install 8.4 && nvm alias default 8.4

RUN yum -y update
RUN yum -y install make, gcc-c++, gcc, git, vim
