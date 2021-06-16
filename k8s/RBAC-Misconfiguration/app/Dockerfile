FROM mhart/alpine-node:15.13.0

WORKDIR /usr/src/app

COPY package*.json ./

RUN apk add --no-cache curl
RUN npm ci --only=production

COPY . .

EXPOSE 8080

CMD ["npm", "start"]
