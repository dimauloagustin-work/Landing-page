FROM node:alpine

WORKDIR /app

RUN apk --no-cache add --virtual native-deps g++ gcc libgcc libstdc++ linux-headers make python

COPY . .

RUN npm install --quiet node-gyp -g
RUN npm install --quiet 

RUN apk del native-deps

CMD ["npm", "start"]