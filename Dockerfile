FROM node:22-bookworm AS build
WORKDIR /app
# Only copy package.json first to leverage Docker cache
COPY package*.json ./
# Install dependencies
RUN --mount=type=cache,target=/cache/node_modules \
    mkdir -p node_modules && \
    cp -a /cache/node_modules /app/node_modules && \
    npm install && \
    cp -a /app/node_modules /cache/node_modules


COPY . .
# Do not keep build files in the final image
# Use a distroless image
FROM gcr.io/distroless/nodejs22-debian12 AS prod
WORKDIR /app
# Only copy the necessary files from the build stage
COPY --from=build /app/src/index.js ./index.js
COPY --from=build /app/package.json ./package.json
COPY --from=build /app/node_modules node_modules
# Startup command
CMD ["index.js"]
