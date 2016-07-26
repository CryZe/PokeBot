# F.A.Q.

**1. What is the purpose of the bot?**

  The bot's objective is to beat its best time for the game - this is a speedrun. In other words, as it falls farther behind, the bot will take more and more risks to try to make up time or end the run trying, to prevent finishing runs that cannot PB.

**2. What are its sum of best splits?**

  Sum of bests are meaningless in Pokémon games. Because certain Pokémon (Spearow/Pidgey, Paras/Oddish) can be caught in separate splits, they are excluded from SoB. Additionally, SoB removes nearly all potioning, and assumes red-barring every possible fight, which simply isn't possible for a single run to do. Furthermore, SoB assumes perfect stats - depending on the current run, different, slower strategies may have to be employed. Unlike many other games therefore, sum of best provides no accurate goal time, and is so difficult to interpret properly that it can effectively only be misunderstood.

**3. Why does it keep resetting**

  The start of the run contains some of the heaviest RNG (luck) in the run. Encounters, bad Nidoran stats, running out of PokéBalls, and death end many runs early. Once we're past Brock, the run is likely to continue until something goes wrong. The bot resets at only a few key points in the run for major time losses (at Bulbasaur, Nidoran, Mt. Moon, and Surge). The bot takes many risks in attempting to get a fast time, so there are many places it can die, forcing it to start over. In addition, we need to catch a Nidoran with good enough stats to complete the route.

**4. Why isn't it potioning, or dying pointlessly?**

  Gen 1 has an interesting, unintended mechanic called "red bar" which activates when your health is at 20% or below. The beeping sound effect causes pokémon cries, and level-up jingles to be skipped over, which saves a significant amount of time over the run. It adds quite a bit of risk to the run, but we can't PB without it.

  Any time we're in red bar, a gen 1 miss (all moves have a 1/256 chance to miss), is almost guaranteed to end the run. Again, this is a risk that must be accepted to go for a fast time.

**5. Why is it walking outside the grass when trying to catch Nidoran?**

  It's a means of RNG (random number generator) manipulation. It's a little complicated, but is also used by human runners. You can find a technical explanation on [PokemonSpeedRuns](http://wiki.pokemonspeedruns.com/index.php/Pok%C3%A9mon_Red/Blue/Yellow_DSum_Manipulation).

**5. Why does it walk behind Prof. Oak before talking to him?**

  Rival moves at half the player's speed. Walking behind costs 7 steps, but reduces Rival's distance by 4 (double this for his speed). This results in one fewer tile's worth of walking time, and is faster.

  A good rule of thumb whenever you see the bot doing something strange, but clearly intentional: it's because it's faster :)

**6. Why does it take a strange path through Viridian Forest?**

  Many tiles in the forest actually can't give encounters, so it stays on these as much as possible. Therefore, an average Forest will only have 0-1 encounters.

**7. Why does the bot use the Center at full HP?**

  We use the Center to restore PP, and to set warp points for Dig. Usually the healing aspect is detrimental, because we lose red bar as a result.

**8. What is the world record?**

  * The fastest time in Pokémon Red/Blue is 1 hour 49 minutes in-game time by Exarion.
  * The fastest time in Pokémon Yellow is 1 hour 55 minutes in-game time by GunnerManiac.

  [View the full leaderboards](http://www.speedrun.com/pokemon)
