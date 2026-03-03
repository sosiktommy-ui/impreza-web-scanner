#!/bin/sh
# Inject IMPREZA_API_URL into the HTML at runtime
# This replaces the config placeholder with the actual API URL

HTML_FILE="/usr/share/nginx/html/index.html"

if [ -n "$IMPREZA_API_URL" ]; then
    # Inject a script tag before the closing </head> that sets the API URL
    sed -i "s|</head>|<script>window.__IMPREZA_API_URL__='${IMPREZA_API_URL}';</script></head>|" "$HTML_FILE"
    echo "✅ API_URL set to: $IMPREZA_API_URL"
else
    echo "⚠️ WARNING: IMPREZA_API_URL not set! Scanner will not work."
fi

# Execute the CMD (nginx)
exec "$@"
