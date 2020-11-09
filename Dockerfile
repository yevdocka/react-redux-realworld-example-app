FROM node:12
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci 
COPY . .
EXPOSE 4100
ENV PORT=4100
CMD [ "node", "node_modules/react-scripts/scripts/start.js" ] 
