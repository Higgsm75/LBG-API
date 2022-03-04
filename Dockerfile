#Base image
FROM node:14
#Set working directory
WORKDIR /app
#Copy the app file image in working directory
COPY . . 
#Run main processes
#add an env variable
ENV PORT=4000
RUN npm install
ENTRYPOINT ["node", "start.js"]
