FROM kobonaut/elm:latest

COPY ./ /app
WORKDIR /app
RUN rm -rf /root/.elm
RUN rm -rf /app/elm-stuff
RUN elm-app build


FROM nginx:alpine
COPY --from=0  /app/build /usr/share/nginx/html


# Run: docker run --name some-nginx -d -p 8080:80 some-content-nginx