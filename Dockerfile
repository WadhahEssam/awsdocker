FROM node:14-alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# the folder /app/build will have all the things that we care about
FROM nginx 

COPY --from=builder /app/build /usr/share/nginx/html