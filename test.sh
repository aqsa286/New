#!/bin/bash

# Replace placeholders in the JSON template with user-provided values
sed -i "s/\"product\": \".*\"/\"product\": \"${2}\"/g" template.json
sed -i "s/\"endpoint\": \".*\"/\"endpoint\": \"${3}\"/g" template.json
sed -i "s/\"request_uri\": \".*\"/\"request_uri\": \"${4}\"/g" template.json
sed -i "s/\"index_pattern\": \".*\"/\"index_pattern\": \"${5}\"/g" template.json

# Add domains to the JSON template
sed -i "/\"domains\": {/a$(awk '{print "\""$1"\": \""$2"\","}' <<< "${@:6}")" template.json
