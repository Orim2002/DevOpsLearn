FROM node:18-slim
WORKDIR /app
COPY --chown=node:node package*.json ./
RUN npm install --production
COPY --chown=node:node . .
USER node
EXPOSE 8080
CMD ["npm", "start"]