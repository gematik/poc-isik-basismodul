# EMR-LIS Communication Implementation Guide

![CI](https://github.com/pmanko/emr-lmis-ig/workflows/CI/badge.svg)

## Building Locally

### Install nodejs
https://nodejs.org/en/download/

### Install Jekyll
Install ruby and ruby gems:
https://www.ruby-lang.org/en/documentation/installation/

Install Jekyll gem
```
gem install jekyll
```

### Install Sushi
```
npm install -g fsh-sushi
sushi --help
```

### Update IG Publisher
```
./_updatePublisher.sh
```

### Run IG Publisher
```
./_genonce.sh
```

### Open Published IG
Open `./output/

## Docker-based Approach

### Install Docker and Docker Compose
- https://docs.docker.com/desktop/

### Run Docker Compose Command

```sh
cd <project-directory>

docker-compose up ig
```

The generated output files should end up in <project-directory>/output. 

Any local changes to the input files will also be picked up due to the volume mappings in the `docker-compose.yml` volume configuration:

```yaml
  ig:
    image: ghcr.io/b-techbw/bw-lab-ig:latest
    container_name: ig
    volumes:
    - ./input:/ig/input 
    - ./output:/ig/output
    
```

### Issues
__https://github.com/pmanko/emr-lis-ig/issues__  

