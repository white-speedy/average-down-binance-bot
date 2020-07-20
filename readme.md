# Average Down Binance Bot
> The documentation is work in progress
>

The bot uses [Average Down strategy](https://www.investopedia.com/terms/a/averagedown.asp) in combination with [EMA indicator](https://www.investopedia.com/terms/e/ema.asp).  
The bot looks with EMA indicator best entry for buy order and places **MARKET** buy order if one found.  
If the buy order is filled **LIMIT** sell order will be placed with profit configure for trading symbol.  
If the price goes down and reaches panic-loss bound, bot cancel sell order and sell bought amount to the current price(put **MARKET** order).  
If the price goes down and reaches loss bound, bot cancels sell order, buys(**MARKET** order) same amount as in the buy order before and place **LIMIT** sell order again.  
If there is not enough amount take additional buy order, the bot do nothing.
Average-down is calculated relative to the last buy order,
The average-down loss factor is calculated by the formula: (configured loss percentage) x (configured loss multiplier) x (number of taken buy order)

 Example:
 ```
 Given loss percentage = 2%, loss multiplier = 0.5 
 for 2. buy order  computed loss percentage = 2*0.5*1 = 1%
 for 3. buy order  computed loss percentage = 2*0.5*2 = 2%
 for 4. buy order  computed loss percentage = 2*0.5*3 = 3%
 ```
When both panic-loss and average-down are valid then panic-loss will be taken.

## System Requirements
* Hardware
  * 4G RAM
  * 2 Core
  * 5G Free Space
* Software
  * OS: Linux or Windows
  * Java 14 or newer

## Configuration
### Trade Configuration
Use config/application.properties file to setup bot trading. There are two main setup parts.
#### Target
Targets are base assets, They define limit for buy order and max concurrent trades for same base asset.
If for examples the concurrent trades number is set to 2 then only two symbols for the same base asset can be handle at the same time.
#### Allowed pairs
Pair defines configuration for trading symbols. The configuration requires
* event-interval - Kline/Candlestick chart intervals (m -> minutes; h -> hours; d -> days; w -> weeks; M -> months)
  * 1m
  * 3m
  * 5m
  * 15m
  * 30m
  * 1h
  * 2h
  * 4h
  * 6h
  * 8h
  * 12h
  * 1d
  * 3d
  * 1w
  * 1M

* profit - sell order price calculation factor (in percent %). The sell price is calculated by the formula: (average buy price * profit)

 Example:
 ```
 Given buy 1: 10 coins by price 20, buy 2: 8 coins by price 10 the profit = 2  
  Average buy price: (10*20 + 8*10)/(10+8) = 15.55 
  Sell Price is then 15.55 * 1.02 = 15,87 per coin
 ```
* loss -
* loss-multiplier -
* panic-loss -

### Run Configuration
> Coming soon
>
* Open start.sh script
* add binance API Key and Binance Secret Key
* If the specified port is unse you can also change the http port
* Save your changes

## Installation
* Download the content of the repository
* Setup your symbols and base assets in the config/application.properties file
* run start.sh script
* enable trading on symbols via REST API
## REST API
 The bot provides REST API. Depends on bot packaging some of the REST resources are not available.
 The REST API is secured with bot signature and requires *Authorization* header. The signature will be generated on bot startup and stored in the ${botHome}/.secret file.
 The authorization header must follow the pattern : `BotSignature {content of the secret file}`.

 Example:
 ```
 curl -X GET  -H "Authorization: BotSignature jjhgkjhg987956720529t828870278002" "http://localhost:8081/v1/api/symbols"
 ```
* List symbols

 Example:
 ```
curl -X GET -H "Authorization: BotSignature a3baf8434a4d68fdcf07d976ca64d849f1441b0b14" "http://localhost:8081/v1/api/symbols"
 ```
* Enable/Disable trading on one or more symbols

 Example:
 ```
curl -X PUT -H "Authorization: BotSignature a3baf8434a4d68fdcf07d976ca64d849f1e4c1441b0b14" "http://localhost:8081/v1/api/symbols?symbols=ETHBTC,BNBUSDT&enable=true"
 ```
* Enable/Disable trading on all symbols

 Example:
 ```
curl -X PUT -H "Authorization: BotSignature a3baf8434a4d68fdcf07d976cab0b14" "http://localhost:8081/v1/api/symbols?symbols=all&enable=true"
 ```

# Declaimer
Copyright (c) white.speedy, Germany. All rights reserved.