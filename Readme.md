Selenium tests runner

Repository with sources of docker image, that is used to run selenium tests at the frontend.
Main component -- headless chrome

##Build image##
````
docker build -t headless-chrome:latest ./
docker tag headless-chrome:latest elasticio/headless-chrome:latest
docker push elasticio/headless-chrome:latest
````


##Build slug##
suppose you are in folder with frontend git repository
````
CIRCLE_BRANCH='YOUR_BRANCH_OR_COMMIT' CIRCLE_ARTIFACTS='slug.tar.gz' .circleci/build_slug.sh
````

##Run application's frontend##
````
cat slug.tar.gz | docker run -i  $(cat .env  | sed 's/^\(.\+\)=\(.*\)$/-e \1=\2/'  | tr '\n' ' ')  elasticio/apprunner:latest start web 
````

##Run##
````
cat ../slug.tar.gz | docker run -i  elasticio/headless-chrome:latest /tests/run_tests.sh
````
