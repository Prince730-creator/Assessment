# Step 1: Build the app
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the code and build
COPY . .
RUN npm run build

# Step 2: Run the app
FROM node:18-alpine AS runner

WORKDIR /app

# Copy only necessary files from builder
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

EXPOSE 3001

CMD ["npm", "start"]

