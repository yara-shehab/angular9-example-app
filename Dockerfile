FROM node:12.16.2
WORKDIR /usr/local/app
COPY ./ /usr/local/app/
RUN npm ci
RUN npm run build --prod
# Serve app with nginx server
FROM nginx:latest
COPY --from=build /usr/local/app/dist/sample-angular-app /usr/share/nginx/html
EXPOSE 80
