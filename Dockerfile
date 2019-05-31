FROM node:alpine as builder
#ENV HTTP_PROXY=http://nl-userproxy-access.net.abnamro.com:8080
#ENV HTTPS_PROXY=http://nl-userproxy-access.net.abnamro.com:8080
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build final output

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html