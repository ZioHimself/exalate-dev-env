FROM adoptopenjdk/openjdk11

LABEL maintainer "Serhiy Onyshchenko <ziohimself@gmail.com>"

ARG IDEA_VERSION=2022.2.3
ARG IDEA_BUILD=2022.2.3
ARG JET_BRAINS_MONO_VERSION=2.242
ARG SBT_VERSION=1.6.2
ARG ATLAS_SDK_VERSION=42510
# ARG ATLAS_SDK_VERSION=8.2.8
ARG NVM_VERSION=v0.39.2
ARG NODE_VERSION=16.13.0

RUN \
  useradd -ms /bin/bash developer


ENV HOME /home/developer
ENV NVM_DIR=/home/developer/.nvm


RUN  \
  apt-get update && apt-get install --no-install-recommends -y \
  gcc git openssh-client less gnupg \
  libxtst-dev libxext-dev libxrender-dev libfreetype6-dev \
  libfontconfig1 libgtk2.0-0 libxslt1.1 libxxf86vm1 \
  curl iproute2 unzip tar gzip \
  && mkdir /working/ \
  && cd /working/ \
  && curl -L -o sbt-$SBT_VERSION.deb https://repo.scala-sbt.org/scalasbt/debian/sbt-$SBT_VERSION.deb \
  && curl -L -o atlassian-sdk.tgz https://marketplace.atlassian.com/download/apps/1210993/version/${ATLAS_SDK_VERSION} \
  && dpkg -i sbt-$SBT_VERSION.deb \
  && rm sbt-$SBT_VERSION.deb \
  && tar xzfv atlassian-sdk.tgz -C /opt \
  && mv /opt/atlassian-plugin-sdk-* /opt/atlassian-plugin-sdk \
  && chown -R developer:developer /opt/atlassian-plugin-sdk \
  && chmod u+x /opt/atlassian-plugin-sdk/bin/* \
  && rm atlassian-sdk.tgz \
  && echo 'export PATH=/opt/atlassian-plugin-sdk/bin:$PATH' >> /home/developer/.bashrc \
  && apt-get update \
  && apt-get --yes install sbt \
  && cd \
  && rm -r /working/ \
  && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash \
  && . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION} \
  && . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION} \
  && . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION} \
  && rm -rf /var/lib/apt/lists/* 

#  && echo "deb https://packages.atlassian.com/debian/atlassian-sdk-deb/ stable contrib" >>/etc/apt/sources.list \
#  && curl -L -o atlassian-gpg-public https://packages.atlassian.com/api/gpg/key/public \
#  && apt-key add atlassian-gpg-public \
#  && apt-get --yes install sbt atlassian-plugin-sdk=${ATLAS_SDK_VERSION} \


ARG idea_source=https://download.jetbrains.com/idea/ideaIU-${IDEA_BUILD}.tar.gz
ARG idea_local_dir=.IntelliJIdea${IDEA_VERSION}
ARG jet_brains_mono=https://download.jetbrains.com/fonts/JetBrainsMono-${JET_BRAINS_MONO_VERSION}.zip

WORKDIR /opt/idea

RUN curl -fsSL $idea_source -o /opt/idea/installer.tgz \
  && tar --strip-components=1 -xzf installer.tgz \
  && rm installer.tgz \
  ; curl -fsSL $jet_brains_mono -o /opt/idea/fonts.zip \
  && mkdir -p /usr/share/fonts \
  && unzip -d /usr/share/fonts /opt/idea/fonts.zip \
  && rm fonts.zip

USER developer
ENV HOME /home/developer

ENV PATH="/home/developer/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

COPY .java /home/developer/.java

RUN mkdir /home/developer/.Idea \
  && ln -sf /home/developer/.Idea /home/developer/$idea_local_dir

CMD [ "/opt/idea/bin/idea.sh" ]
