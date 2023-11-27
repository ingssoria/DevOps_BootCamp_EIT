FROM node:20.6-alpine3.17 AS builder
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY ./src/app.js ./src/
RUN npm run build

# deploy stage

FROM node:20.6-alpine3.17
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY --from=builder /app/dist .
EXPOSE 8080
CMD [ "node", "app.js" ]