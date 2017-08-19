FROM node:6-alpine

# install hexo
RUN apk add --no-cache git
RUN npm install -g hexo-cli

WORKDIR /blog
USER node

EXPOSE 4000
ENTRYPOINT ["hexo"]
CMD ["server"]
