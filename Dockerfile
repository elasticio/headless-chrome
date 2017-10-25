FROM ubuntu:zesty
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install curl
RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update
RUN apt-get -y install libasound2 libcairo2 libcups2 libatk1.0-0 gconf-service libgconf-2-4 libglib2.0-0 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libxss1 libnss3 lsb-release libnss3 xdg-utils fonts-liberation libappindicator1
RUN apt-get -y install google-chrome-stable
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs
RUN mkdir -p /tests
COPY run_tests.sh /tests/run_tests.sh
ENTRYPOINT /tests/run_tests.sh
