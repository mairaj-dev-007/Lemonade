# Use full Debian-based Node image for more memory stability
FROM node:20 AS builder

WORKDIR /app
COPY . .

RUN npm install
RUN npm run build

FROM node:20-slim
WORKDIR /app

COPY --from=builder /app ./

EXPOSE 3000
CMD ["npm", "start"]

