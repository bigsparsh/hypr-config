req=$(curl -s -X GET https://api.nasa.gov/planetary/apod?api_key=sBJuFgSLcidVKr8Tqc7y5vh6zVx7k0IuKbTUrCxa | jq -r .hdurl)

if [ "$req" == "null" ] || [ -z "$req" ]; then
    echo "Error: Could not fetch HD URL. It might be a video today."
    exit 1
fi

wget -O /tmp/todays-pic.jpg "$req"

source /home/big/scripts/change-wall.sh /tmp/todays-pic.jpg
