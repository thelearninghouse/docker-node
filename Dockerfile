FROM node:8.11-alpine
LABEL Maintainer="Michael Bunch <mbunch@learninghouse.com>"

# Include application files
COPY . /app

# Use application folder
WORKDIR /app

# Install production modules only and clear the global cache
RUN yarn install --production --non-interactive && \
    yarn cache clean

# Run the application
RUN chmod 755 /app/entrypoint.sh
CMD [ "/app/entrypoint.sh" ]
