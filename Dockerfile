# FROM node:20 AS build
# ARG VITE_BACKEND_URL=https://glowing-happiness-x5px46j9jgw6cv54v-3001.app.github.dev/api/v1
# WORKDIR /build
# COPY package.json .
# COPY package-lock.json .
# RUN npm install
# COPY . .
# RUN npm run build
# FROM nginx AS final
# WORKDIR /usr/share/nginx/html
# COPY --from=build /build/dist .

FROM node:20 AS build
ARG VITE_BACKEND_URL=https://glowing-happiness-x5px46j9jgw6cv54v-3000.app.github.dev/api/v1
WORKDIR /build
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000
# Start the SSR server
CMD ["npm", "start"]