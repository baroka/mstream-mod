```shell
Docker image for linuxserver/mstream mod. Adds index watch music

PREREQUISITES
 - Docker installed
 - linuxserver/mstream

INSTALLATION
 - Docker compose example: 

# Mstream
  mstream:
    container_name: mstream
    image: linuxserver/mstream:latest
    restart: unless-stopped
    depends_on:
      - traefik
    networks:
      - t2_proxy
    security_opt:
      - no-new-privileges:true
    volumes:
      - $DOCKERDIR/mstream/config:/config
      - $DATADIR/Musica:/music:ro
    environment:
      - TZ=$TZ
      - PGID=$PGID
      - PUID=$PUID
      - DOCKER_MODS=baroka/mstream-mod:latest

 - $DOCKERDIR points to your local path for script files
```
