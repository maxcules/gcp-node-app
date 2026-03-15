FROM node:20-alpine

WORKDIR /app

# Install dependencies first
COPY package*.json ./
RUN npm install --production

# Copy application files
COPY . .

EXPOSE 3000

CMD ["node", "nodeapp.js"]
