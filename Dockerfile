FROM node:10-alpine

RUN npm cache clean --force && \
	npm config set strict-ssl false && \
	apk add wget unzip curl 
	#wget --no-check-certificate https://github.com/prabushitha/gremlin-visualizer/archive/master.zip && \
	#unzip master.zip && \
	#cd gremlin-visualizer-master && \
	#npm install

RUN mkdir  gremlin-visualizer-master
    
COPY . gremlin-visualizer-master/


RUN cd gremlin-visualizer-master && \
	npm install

EXPOSE 3000 3001

WORKDIR /gremlin-visualizer-master

CMD npm start
