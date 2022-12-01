FROM node:16-slim

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
&& sed -i s@/security.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
&& apt update \
&& apt install git -y \
&& apt clean \
&& yarn config set registry https://registry.npmmirror.com --global

WORKDIR /docs

ARG REPO
ARG BRANCH

RUN echo "2022-09-06 17:50:00" \
&& git clone $REPO Documents \
&& cd Documents \
&& git checkout $BRANCH

WORKDIR /docs/Documents/source 
RUN yarn add @docusaurus/theme-search-algolia \
&& yarn add @docusaurus/plugin-sitemap

RUN yarn install \
&& yarn build

RUN git config --global user.email "you@example.com" \
&& git config --global user.name "Your Name" \
&& cd .. && git add source/package.json source/yarn.lock \
&& git commit -m "nothing"

WORKDIR /docs

COPY ./start.sh .
COPY ./update.sh .

CMD ./start.sh $START_BRANCH
