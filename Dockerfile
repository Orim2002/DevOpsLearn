FROM node:18-slim AS builder
WORKDIR /app
COPY --chown=node:node package*.json ./
RUN npm install --production
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --chown=node:node . .
USER node
EXPOSE 8080
CMD ["npm", "start"]