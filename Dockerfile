FROM node:14 as builder

ARG VITE_API_URL
ENV VITE_API_URL=$VITE_API_URL

WORKDIR /data/app
COPY . .
RUN yarn
RUN yarn build

FROM node:14-alpine
RUN apk upgrade

WORKDIR /app
RUN mkdir -p /app/src/lib/server/views/email/
COPY --from=builder /data/app/build .
COPY --from=builder /data/app/package.json .
COPY --from=builder /data/app/node_modules ./node_modules
COPY --from=builder /data/app/src/lib/server/views/email ./src/lib/server/views/email/

