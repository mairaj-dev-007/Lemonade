# Stage 1: Builder
FROM node:20 AS builder

WORKDIR /app
COPY . .

# Optional: Improve build stability
ENV NODE_OPTIONS=--max_old_space_size=1024

RUN npm install
RUN npm run build

# Stage 2: Runtime
FROM node:20-slim
WORKDIR /app

# Copy only built app from builder
COPY --from=builder /app ./

# Expose the default port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]

