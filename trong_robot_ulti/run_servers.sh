#!/bin/bash
# Example usage
# sh run_servers.sh

source ~/.bashrc

echo "*********************"
echo "Starting Jupyter:"
jupyter notebook --ip 0.0.0.0 --port 8888 --no-browser --allow-root & 
echo "*********************"
