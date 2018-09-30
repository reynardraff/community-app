# Builds production version of Community App inside Docker container,
# and runs it against the specified Topcoder backend (development or
# production) when container is executed.

FROM node:8.11.2
LABEL app="Community App" version="1.0"

WORKDIR /opt/app
COPY . .

################################################################################
# Receiving of build arguments.

ARG AUTH0_CLIENT_ID
ARG CDN_URL
ARG COGNITIVE_NEWSLETTER_SIGNUP_APIKEY
ARG COGNITIVE_NEWSLETTER_SIGNUP_URL
ARG CONTENTFUL_CDN_API_KEY
ARG CONTENTFUL_PREVIEW_API_KEY
ARG CONTENTFUL_SPACE_ID

# Credentials for access to Expert Communities space in Contentful CMS
ARG CONTENTFUL_EXPERT_COMMUNITIES_SPACE_ID
ARG CONTENTFUL_EXPERT_COMMUNITIES_CDN_API_KEY
ARG CONTENTFUL_EXPERT_COMMUNITIES_PREVIEW_API_KEY

# Credentials for access to TopGear space in Contentful CMS
ARG CONTENTFUL_TOPGEAR_SPACE_ID
ARG CONTENTFUL_TOPGEAR_CDN_API_KEY
ARG CONTENTFUL_TOPGEAR_PREVIEW_API_KEY

ARG FILESTACK_API_KEY
ARG FILESTACK_SUBMISSION_CONTAINER

# Credentials for Mailchimp service
ARG MAILCHIMP_API_KEY
ARG MAILCHIMP_BASE_URL

ARG NODE_CONFIG_ENV
ARG OPEN_EXCHANGE_RATES_KEY
ARG SEGMENT_IO_API_KEY
ARG SERVER_API_KEY

################################################################################
# Setting of environment variables in the Docker image.

ENV AUTH0_CLIENT_ID=$AUTH0_CLIENT_ID
ENV CDN_URL=$CDN_URL
ENV COGNITIVE_NEWSLETTER_SIGNUP_APIKEY=$COGNITIVE_NEWSLETTER_SIGNUP_APIKEY
ENV COGNITIVE_NEWSLETTER_SIGNUP_URL=$COGNITIVE_NEWSLETTER_SIGNUP_URL
ENV CONTENTFUL_CDN_API_KEY=$CONTENTFUL_CDN_API_KEY
ENV CONTENTFUL_PREVIEW_API_KEY=$CONTENTFUL_PREVIEW_API_KEY
ENV CONTENTFUL_SPACE_ID=$CONTENTFUL_SPACE_ID

# Credentials for access to Expert Communities space in Contentful CMS
ENV CONTENTFUL_EXPERT_COMMUNITIES_SPACE_ID=$CONTENTFUL_EXPERT_COMMUNITIES_SPACE_ID
ENV CONTENTFUL_EXPERT_COMMUNITIES_CDN_API_KEY=$CONTENTFUL_EXPERT_COMMUNITIES_CDN_API_KEY
ENV CONTENTFUL_EXPERT_COMMUNITIES_PREVIEW_API_KEY=$CONTENTFUL_EXPERT_COMMUNITIES_PREVIEW_API_KEY

# Credentials for access to TopGear space in Contentful CMS
ENV CONTENTFUL_TOPGEAR_SPACE_ID=$CONTENTFUL_TOPGEAR_SPACE_ID
ENV CONTENTFUL_TOPGEAR_CDN_API_KEY=$CONTENTFUL_TOPGEAR_CDN_API_KEY
ENV CONTENTFUL_TOPGEAR_PREVIEW_API_KEY=$CONTENTFUL_TOPGEAR_PREVIEW_API_KEY

ENV FILESTACK_API_KEY=$FILESTACK_API_KEY
ENV FILESTACK_SUBMISSION_CONTAINER=$FILESTACK_SUBMISSION_CONTAINER

# Credentials for Mailchimp service
ENV MAILCHIMP_API_KEY=$MAILCHIMP_API_KEY
ENV MAILCHIMP_BASE_URL=$MAILCHIMP_BASE_URL

ENV NODE_CONFIG_ENV=$NODE_CONFIG_ENV
ENV OPEN_EXCHANGE_RATES_KEY=$OPEN_EXCHANGE_RATES_KEY
ENV SEGMENT_IO_API_KEY=$SEGMENT_IO_API_KEY
ENV SERVER_API_KEY=$SERVER_API_KEY

################################################################################
# Testing and build of the application inside the container.

RUN npm install
RUN npm test
RUN npm run build

EXPOSE 3000
CMD ["npm", "start"]
