# Stage 1: Builder
FROM node:20 AS builder

WORKDIR /app

# Copy env file first
COPY .env .env

# Copy rest of the code
COPY . .

RUN npm install
RUN npm run build

# Stage 2: Runtime
FROM node:20-slim
WORKDIR /app

COPY --from=builder /app ./

EXPOSE 3000
CMD ["npm", "start"]

