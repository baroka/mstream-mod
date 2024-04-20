# build:
#  docker build -t baroka/mstream-mod .

FROM scratch

# Copy local files
COPY root/ /