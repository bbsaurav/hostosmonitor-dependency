# hostosmonitor-dependency

This repository contains the dockerfile which installs all the dependencies of HostOSMonitor on latest ubuntu's image from docker hub.

To build the Dockerfile use below command:

    docker build --rm -f "Dockerfile" -t bbsaurav/hostosmonitor-dependency:latest .

To push updated image to docker hub use below command:

    docker push bbsaurav/hostosmonitor-dependency:latest
