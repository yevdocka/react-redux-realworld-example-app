# The base is dockerhub image version 12
FROM node:12
# The location where the app is going to run from and WORKDIR is where rest of the docker file 
# is going to run
WORKDIR /usr/src/app
# Copying package.json and package-lock.json to WORKDIR location. Package.json and package-lock.json
# are the dependicies for npm ci command that is next
COPY package*.json ./
# Runs npm within the image. The CI part looks into package.json and matches with package-lock.json
# and if matches it installs dependecies that were written out inside package-lock.json
RUN npm ci 
# First . copies entire directory where the docker file is except whatever is in .dockerignore.  
# to Second . which is WORKDIR
COPY . .
#Firewall opening up port 4100
EXPOSE 4100
# Port where the app will open
ENV PORT=4100
# Execution command when you run container 
CMD [ "node", "node_modules/react-scripts/scripts/start.js" ] 
