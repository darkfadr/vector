# Extend the official Vector alpine image
FROM timberio/vector:latest-alpine

# Copy the entrypoint script and make it executable
COPY --chmod=755 entrypoint.sh /entrypoint.sh

# VECTOR_CONFIG should contain the full vector configuration as a string.
# The entrypoint writes it to /tmp/vector.yaml and starts vector with that file.
ENV VECTOR_CONFIG=""

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
