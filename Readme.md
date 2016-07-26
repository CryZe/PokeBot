# PokéBot

An automated computer program that speedruns Pokémon generation 1 games.

![Nidoking Running (by MoofinSeeker)](http://static-cdn.jtvnw.net/jtv_user_pictures/panel-60552281-image-c4fbec3cb87cecc1-320.png)

Pokémon Red (Any% Glitchless) personal best runs:

* [1:48:56](https://secure.twitch.tv/pokespeedrunbots/v/78433035) (16 July 2016)
* [1:50:15](https://www.twitch.tv/pokespeedrunbots/v/41012048) (10 Match 2015)



## Watch live

### [twitch.tv/pokespeedrunbots](https://www.twitch.tv/pokespeedrunbots/)

PokéBot’s Unofficial streaming channel on Twitch. Consider following there to find out when we’re streaming.

### Run the bot locally

Follow this tutorial by Monk Preston : [Click here](http://imgur.com/a/cbHWb)

## Seeds

PokéBot comes with a built-in run recording feature that takes advantage of random number seeding to reproduce runs in their entirety. Any time the bot resets or beats the game, it will log a number to the Lua console that is the seed for the run. If you set `CUSTOM_SEED` in `main.lua` to that number, the bot will reproduce your run, allowing you to [share your times with others](wiki/Seeds.md). Note that making any other modifications will prevent this from working. So if you want to make changes to the bot and share your time, be sure to fork the repo and push your changes.

## Other Categories

The bot is designed to run "any% glitchless" (beat the game as fast as possible, without major glitches) categories - the most popular in the speedrunning community. However, the bot can easily be adapted for other purposes including use in testing frame data for human players, or to run different categories of the game.

[Red Any% No Save Corruption](https://github.com/bouletmarc/PokeBot) by [Marc-Andre Boulet](https://github.com/bouletmarc)

If you're interested in adapting the bot to other categories or games, we'd love to see it, and are happy to help answer questions.

## Credits

### Developers

Kyle Coburn: Original concept, Red/Yellow routing

Michael Jondahl: Combat algorithm, Java bridge for Twitch chat/responders, LiveSplit, DB, Twitter, etc.

Rhys Jones: Maintaing and updated bot to work with Bizhawk version higher than 1.6

### Special thanks

To [MoofinSeeker](http://www.twitch.tv/moofinseeker) - for the amazing channel description artwork (seen above).

To our Twitch chat moderators who help answer questions, and make the stream a great place to hang out.

To [LiveSplit](http://livesplit.org) for providing the custom component for integrating in-game time splits.

To the [contributor community](https://github.com/kylecoburn/PokeBot/graphs/contributors) here, who have helped track seeds and improve the bot.

To the Pokémon speedrunning community members who inspired the idea, and shared their knowledge on ways to improve the bot.

_Enjoy!_
