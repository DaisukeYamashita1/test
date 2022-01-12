FROM centos:8

RUN yum update -y
RUN yum install -y gcc-c++ glibc-headers openssl-devel readline \
    libxml2-devel libxslt-devel sqlite-devel wget git bzip2 bzip2-devel
    
RUN yum -y install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

RUN yum install make -y
RUN yum install -y readline-devel
RUN yum install -y nodejs
RUN yum -y reinstall glibc-common
RUN yum clean all

RUN npm install -g yarn

# ロケール設定

ENV LANG=ja_JP.UTF-8
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'ENV RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'ENV PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh

# install ruby-build
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
ENV RBENV_ROOT /usr/local/rbenv
ENV PATH "$RBENV_ROOT/bin:$RBENV_ROOT/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

ENV APP_HOME /srv/aws-educate
RUN mkdir ${APP_HOME}
WORKDIR ${APP_HOME}

ADD Gemfile ${APP_HOME}/Gemfile
ADD Gemfile.lock ${APP_HOME}/Gemfile.lock

ENV CONFIGURE_OPTS --disable-install-doc
ADD .ruby-version ${APP_HOME}/
RUN rbenv install `cat ${APP_HOME}/.ruby-version` && rbenv global `cat ${APP_HOME}/.ruby-version` && rbenv rehash

RUN gem install bundler -v '2.1.4'
RUN bundle install

ADD . ${APP_HOME}
