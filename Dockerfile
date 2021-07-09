FROM node:10-alpine as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build --prod
# Serve app with nginx server
FROM nginx:latest
COPY --from=build /usr/local/app/dist/sample-angular-app /usr/share/nginx/html
EXPOSE 80
