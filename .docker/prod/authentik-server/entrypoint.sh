#!/bin/bash
set -e

# Apply umask for runtime
umask "${UMASK:-0002}"

# Execute the original authentik entrypoint with the command
exec /lifecycle/ak "$@"