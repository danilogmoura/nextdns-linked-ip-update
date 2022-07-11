FROM alpine:3.16.0

LABEL maintainer="Danilo Moura <danilogmoura@gmail.com>"

ENV SCRIPT_DIR=/usr/local/bin

COPY ./script.sh ${SCRIPT_DIR}/script.sh

RUN apk update 
RUN apk --no-cache add curl
RUN echo "0 */1 * * *    ${SCRIPT_DIR}/script.sh ${SCRIPT_DIR}/dns-profiles" > /etc/crontabs/root

CMD ["crond", "-f"]