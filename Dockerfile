FROM node:16.15.1 as builder

RUN mkdir -p /app

WORKDIR /app

COPY . .

RUN npm install --force
RUN npm run build --prod

#CMD ["npm", "start"]

FROM nginx:alpine
COPY src/nginx/etc/conf.d/default.conf /etc/nginx/conf/default.conf
COPY --from=builder app/dist/angular8-crud-demo usr/share/nginx/html


