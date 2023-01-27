From node:latest as build

WORKDIR /myapp

COPY . /myapp

RUN cd webapp && npm install

RUN cd webapp && npm run build



From nginx

Copy --from=build /myapp/webapp/dist/ /usr/share/nginx/html/

Expose 80






