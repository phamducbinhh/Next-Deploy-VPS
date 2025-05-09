# ---------- STAGE 1: Build ----------
    FROM node:20-alpine AS builder

    WORKDIR /app
    
    COPY package*.json ./
    RUN npm install
    
    COPY . .
    RUN npm run build
    
    # ---------- STAGE 2: Run ----------
    FROM node:20-alpine
    
    WORKDIR /app
    
    # Chỉ copy phần cần thiết từ stage build
    COPY --from=builder /app/package*.json ./
    COPY --from=builder /app/.next .next
    COPY --from=builder /app/public ./public
    COPY --from=builder /app/node_modules ./node_modules
    
    ENV NODE_ENV=production
    
    EXPOSE 3000
    CMD ["npm", "start"]
    