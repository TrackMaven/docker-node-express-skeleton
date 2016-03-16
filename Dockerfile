FROM node:4.2
MAINTAINER Josh Finnie <josh.finnie@trackmaven.com>

RUN npm install -g pm2@1.0.2 babel-core@6.7.2 babel-cli@6.6.4

WORKDIR /code/

ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /code && cp -a /tmp/node_modules /code

ADD .babelrc /code/.babelrc
ADD app /code/app

CMD ["pm2", "start", "/code/app/app.json", "--no-daemon"]
