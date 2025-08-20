# Build stage
FROM node:18-alpine AS builder

# Install pnpm
RUN npm install -g pnpm@latest

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install --frozen-lockfile || pnpm install --force

# Copy source code
COPY . .

# Generate Houdini files
RUN pnpm run gen

# Build the application
RUN pnpm run build

# Production stage
FROM nginx:alpine AS production

# Copy built files from builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"] 