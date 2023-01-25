From node:latest as build

WORKDIR /myapp

COPY package*.json /myapp

RUN npm install

COPY . /myapp

RUN npm run build

From nginx

Copy --from=build /myapp/dist /usr/share/nginx/html

Expose 80

CMD ["nginx", "-g", "daemon off"]





