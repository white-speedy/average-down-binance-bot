@ECHO OFF

REM Please enter your binance api and secret keys

SET API_KEY=your binance api key
SET API_SECRET=your binance secret key


SET PORT=8081
SET BOT_HOME=.bot
SET BOT_LOG_LEVEL=info

SET JAVA_OPTIONS=-Xms1g -Xmx3g -Djava.security.egd=file:/dev/./urandom

java %JAVA_OPTIONS% -jar libs\averagedown-bot-0.0.1-free.jar