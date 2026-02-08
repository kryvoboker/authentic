FROM authentik/server:2025.12.2

# Import UID and GID from docker compose
ARG UID=1000
ARG GID=1000
ARG UMASK=0002

ENV UID=${UID}
ENV GID=${GID}
ENV UMASK=${UMASK}

ENV USERNAME=authentik

USER root

# Create postgres group and user with specific UID/GID if they don't match
RUN deluser ${USERNAME} 2>/dev/null || true \
  && delgroup ${USERNAME} 2>/dev/null || true \
  && addgroup --gid ${GID} ${USERNAME} \
  && adduser --uid ${UID} --gid ${GID} ${USERNAME}

# Copy custom entrypoint
COPY .docker/prod/authentik-server/entrypoint.sh /usr/local/bin/custom-entrypoint.sh

RUN chmod +x /usr/local/bin/custom-entrypoint.sh

USER ${USERNAME}

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]
CMD ["server"]