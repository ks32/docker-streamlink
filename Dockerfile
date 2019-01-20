FROM python:3-alpine
RUN apk add gcc musl-dev --no-cache \
	&& pip install streamlink \
	&& apk del gcc musl-dev --no-cache \
	&& apk add --no-cache bash \
	&& rm -Rf /tmp/*
COPY youtube.py ./usr/local/lib/python3.7/site-packages/streamlink/plugins/youtube.py
EXPOSE 8080
ENTRYPOINT ["streamlink", \
	"--player-external-http", \
	"--player-external-http-port", "8080" \
]
