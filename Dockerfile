FROM node:latest

EXPOSE 8601
RUN mkdir /app
COPY ./scratch-gui /app/scratch-gui
RUN cd /app/scratch-gui && \
    npm install 

WORKDIR /app/scratch-gui

ENTRYPOINT ["npm", "start"]
