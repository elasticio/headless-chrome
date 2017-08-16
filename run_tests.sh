#!/bin/bash
cd /tests
cat | tar -xzf - -C /tests
npm install selenium-webdriver chromedriver mocha
npm run test:selenium
