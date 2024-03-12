FROM node:latest

WORKDIR /app

RUN apt-get update && apt-get install -y git-core
RUN npm install -g svgo

COPY svg_sprite_generator.sh /app/svg_sprite_generator.sh
COPY svgo.config.mjs /app/svgo.config.mjs

RUN chmod +x /app/svg_sprite_generator.sh

CMD ["/app/svg_sprite_generator.sh"]
