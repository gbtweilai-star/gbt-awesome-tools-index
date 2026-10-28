#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
PYTHONPATH=src python -m gbt_awesome_tools_index info
PYTHONPATH=src python -m gbt_awesome_tools_index check --payload '{}'
PYTHONPATH=src python -m gbt_awesome_tools_index run   --payload '{}'
