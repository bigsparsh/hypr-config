#!/bin/bash

# Define target URL and output path
TARGET_URL="https://www.nationalgeographic.com/photography/photo-of-the-day/"
SAVE_PATH="$HOME/Pictures/NatGeo_POTD.jpg"

echo "Fetching Photo of the Day URL..."

# 1. Fetch the HTML
# 2. Find the twitter:image or og:image meta tag
# 3. Extract the URL between the quotes
IMG_URL=$(curl -s $TARGET_URL | grep -oE 'meta property="og:image" content="[^"]+"' | cut -d'"' -f4)

if [ -z "$IMG_URL" ]; then
    echo "Could not find image URL. The site structure may have changed."
    exit 1
fi

echo "Downloading image: $IMG_URL"

# Download the image
curl -s -o "$SAVE_PATH" "$IMG_URL"

echo "Saved to $SAVE_PATH"
