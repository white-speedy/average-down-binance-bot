#!/bin/sh

# Please enter your binance api and secret keys
export API_KEY="your bnance api key"
export API_SECRET="your bnance secret key"

export PORT="8081"
export BOT_HOME=".bot"
export BOT_LOG_LEVEL="info"

JAVA_OPTIONS="-Xms1g -Xmx3g -Djava.security.egd=file:/dev/./urandom"

java ${JAVA_OPTIONS} -jar libs/averagedown-bot-0.0.1-free.jar

