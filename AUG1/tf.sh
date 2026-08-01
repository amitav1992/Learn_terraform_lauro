#!/usr/bin/env bash
set -euo pipefail

# Uses default profile unless AWS_PROFILE is already set in the shell.
profile="${AWS_PROFILE:-default}"

if ! command -v aws >/dev/null 2>&1; then
  echo "Error: aws CLI is not installed or not in PATH." >&2
  exit 1
fi

if ! command -v terraform >/dev/null 2>&1; then
  echo "Error: terraform is not installed or not in PATH." >&2
  exit 1
fi

if [ "$#" -eq 0 ]; then
  echo "Usage: ./tf.sh <terraform arguments>" >&2
  echo "Example: ./tf.sh plan" >&2
  echo "Example: ./tf.sh apply" >&2
  exit 1
fi

if ! creds="$(aws configure export-credentials --profile "$profile" --format env 2>/dev/null)"; then
  echo "Error: could not export credentials for profile '$profile'." >&2
  echo "Run: aws configure sso (or your org login command), then retry." >&2
  exit 1
fi

eval "$creds"
exec terraform "$@"