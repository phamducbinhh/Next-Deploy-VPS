# Sử dụng image Node.js chính thức làm base image
FROM node:20-alpine

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép package.json và package-lock.json
COPY package*.json ./

# Cài đặt dependencies
RUN npm install

# Sao chép toàn bộ mã nguồn
COPY . .

# Build ứng dụng Next.js
RUN npm run build

# Mở cổng mà Next.js sử dụng
EXPOSE 3000

# Lệnh để chạy ứng dụng
CMD ["npm", "start"]