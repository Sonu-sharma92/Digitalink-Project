From node:latest as build

WORKDIR /myapp

COPY . /myapp

RUN cd webapp

RUN npm install && npm run build

From nginx

Copy --from build /myapp/dist/* var/www/html

Expose 80





