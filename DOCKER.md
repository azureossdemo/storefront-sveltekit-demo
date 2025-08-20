# Docker Setup

This project includes Docker configuration for both development and production environments.

## Production Build

### Using Docker Compose (Recommended)

```bash
# Build and run the production container
docker-compose up --build

# Run in background
docker-compose up -d --build

# Stop the container
docker-compose down
```

### Using Docker directly

```bash
# Build the production image
docker build -t storefront-sveltekit .

# Run the container
docker run -p 3000:80 storefront-sveltekit
```

## Development Build

### Using Docker Compose

```bash
# Build and run the development container
docker-compose -f docker-compose.dev.yml up --build

# Run in background
docker-compose -f docker-compose.dev.yml up -d --build

# Stop the container
docker-compose -f docker-compose.dev.yml down
```

### Using Docker directly

```bash
# Build the development image
docker build -f Dockerfile.dev -t storefront-sveltekit-dev .

# Run the development container
docker run -p 5173:5173 -v $(pwd):/app storefront-sveltekit-dev
```

## Accessing the Application

- **Production**: http://localhost:3000
- **Development**: http://localhost:5173

## Environment Variables

You can set environment variables by creating a `.env` file or passing them through docker-compose:

```yaml
environment:
  - NODE_ENV=production
  - YOUR_CUSTOM_VAR=value
```

## Notes

- The production build uses nginx to serve static files
- The development build includes hot reloading
- The `.dockerignore` file excludes unnecessary files from the build context
- Health checks are included in the production docker-compose configuration 