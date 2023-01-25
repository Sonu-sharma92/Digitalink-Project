From node:latest as build

WORKDIR /myapp

RUN npm install

RUN npm run build

COPY . /myapp

From nginx

Copy --from=build /myapp/dist /usr/share/nginx/html

Expose 80






