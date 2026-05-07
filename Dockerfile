# Stage 1: obtain a statically-linked shell from busybox
FROM busybox:1.36 AS busybox

# Stage 2: extend the official Vector alpine image
FROM timberio/vector:latest-alpine

# Copy busybox's sh (kept for consistency across base image variants)
COPY --from=busybox /bin/sh /bin/sh

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# VECTOR_CONFIG should contain the full vector configuration as a string.
# The entrypoint writes it to /tmp/vector.yaml and starts vector with that file.
ENV VECTOR_CONFIG=""

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
