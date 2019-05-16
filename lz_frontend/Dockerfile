FROM node:12 as builder
COPY ./ /app
WORKDIR /app
RUN npm install && npm run build

FROM nginx
RUN mkdir /app
COPY --from=builder /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
