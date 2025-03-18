# ใช้ Node.js image เป็น base image
FROM node:18-alpine

# ตั้ง working directory ใน container
WORKDIR /app

# คัดลอก package.json และ package-lock.json (หรือ yarn.lock)
COPY package*.json ./

# ติดตั้ง dependencies
RUN npm install

# คัดลอกโค้ดทั้งหมด
COPY . .

# สร้าง build ของ React app
RUN npm run build

# ใช้ nginx เป็น server สำหรับ static files
FROM nginx:alpine

# คัดลอก build จาก stage ก่อนหน้า
COPY --from=0 /app/build /usr/share/nginx/html

# expose port 80
EXPOSE 80

# เริ่มต้น nginx
CMD ["nginx", "-g", "daemon off;"]