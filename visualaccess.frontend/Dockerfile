FROM node:18.18.0-alpine as build-stage
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .

ARG BE_URL
RUN if [ -z "$BE_URL" ]; then echo "BE_URL argument not provided" && exit 1; fi
ENV REACT_APP_BACKEND_URL=$BE_URL

RUN npm run build

FROM node:18.18.0-alpine
WORKDIR /app
COPY --from=build-stage /app/build .
RUN npm install -g serve
CMD ["serve", "-s", ".", "-l", "3000"]

EXPOSE 3000
