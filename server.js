'use strict';

const express = require('express');

// Constants
const VERSION  = 1
const HOST     = '0.0.0.0';
const PORT     = process.env.PORT || 8080;
const HOSTNAME = process.env.HOSTNAME    || 'unknown';
const ENV      = process.env.ENVIRONMENT || 'unknown';
const INFRA    = process.env.INFRA       || 'unknown';

// App
const app = express();
app.get('/', (req, res) => {
  res.send(`Hello World! v${VERSION} in ${ENV}-${INFRA} on ${HOSTNAME}\n`);
  console.log("Request at: " + new Date().toString());
});

app.listen(PORT, HOST => 
    console.log(`Running v${VERSION} in ${ENV}-${INFRA} on http://${HOST}:${PORT}`)
);
