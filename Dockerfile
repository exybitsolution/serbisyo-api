FROM node:22-alpine

# Install OpenSSL and pnpm
RUN apk update && apk add --no-cache openssl && npm install -g pnpm

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and pnpm-lock.yaml
COPY package*.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy the rest of the application code
COPY . .

RUN pnpm run build

CMD ["pnpm", "run", "start:prod"]