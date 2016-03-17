FROM node:4.4.0
MAINTAINER Josh Finnie <josh.finnie@trackmaven.com>

RUN npm install -g pm2@1.0.2 babel-core@6.7.2

ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /code && cp -a /tmp/node_modules /code

ADD .babelrc /code/.babelrc
ADD app /code/app

WORKDIR /code/

CMD ["pm2", "start", "/code/app/app.json", "--no-daemon"]
