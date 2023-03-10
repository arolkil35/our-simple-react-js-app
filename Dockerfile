#Build Steps
FROM node:alpine3.17 as build-step

RUN mkdir /app
WORKDIR /app

COPY package.json /app
RUN npm install
COPY . /app

RUN npm run build

#Run Steps
FROM nginxinc/nginx-unprivileged
COPY --from=build-step /app/build /usr/share/nginx/html