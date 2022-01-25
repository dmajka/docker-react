# Build Phase - Install dependencies
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase - Run the app
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html