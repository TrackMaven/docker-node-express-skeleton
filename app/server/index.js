'use strict';

import http from 'http';

import bodyParser from 'body-parser';
import cookieParser from 'cookie-parser';
import express from 'express';

import api from './api';

console.log("in server/index.js");

let app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());

app.use('/api', api());

app.server = http.createServer(app);
app.server.listen(process.env.PORT || 8080);

console.log(`Started on port ${app.server.address().port}.`);

export default app;
