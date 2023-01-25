From node:latest as build

WORKDIR /myapp

RUN cd webapp && npm install

RUN cd webapp && npm run build

COPY . /myapp

From nginx

Copy --from=build /myapp/dist /usr/share/nginx/html

Expose 80






