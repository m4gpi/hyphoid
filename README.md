# Hyphoid

A resource-based mining game set grid-map

Based on some of my favourite strategy games such as Tribal Wars, Dungeon Keeper, Age of Empires and Civilisation and encompassing a
passion for ecology and better understanding and appreciating the Earth's ecosystems, particularly the role of mycorrhizal
fungi. The aim of the game is to build subsoil colonies and mine nutrients from these mycelial hubs, connect with Trees to
access normally inaccessible resources and connect all the trees in the forest.


<p align="center">
<img src="http://images.universityherald.com/data/images/full/5277/mycorrhizal-fungi.jpg" width="350"/>
</p>

# Built using Active Record &amp; Rails.


### Project Requirements ###

GAME GOAL: Mine all the resources OR connect all the trees OR defeat all competitors OR achieve a certain goal cooperatively

1. Build a turn-based game using mycelium/hypha/spores
2. It is based loosely around a concept of Mining/Farming
3. Stores of Carbon, Nitrates, Phosophates, Sugars are available
4. Turn based game OR Live and steady incrementing?
5. Quantity of hyphae increases resource yield
6. Hyphae act as miners. Mycelia are the hub/store of resources. Requests can be made to trees for Sugars in exchange for phosphates or nitrates or lasting relationships such as "Protection from Pathogens"
7. Spores, Mushrooms and Hyphae require resources to produce.
8. The game cannot be won without trading with Trees.
9. Central resource re-population occurs automatically at the start of a turn OR steadily increases across time
10. Mushrooms are purely the vehicle for expanding into new territory, creating new mycelia which act as new mining hubs.

In the long run, a double stack grid system would work. Each "location" contains its own smaller grid for hyphae moving. They can also move between locations if the x-position + y-position allow.

# Relationships & Models:

Single player - Could be turned into a multiplayer game with a many-to-many relationship between players and levels

# Player
has_many :mycelia
name:

# Level
has_many :locations

name:
number:
difficulty:

includes a method which initialises the construction of a grid for each level

# Location / GridSquare
belongs_to :level
has_one :mycelia
has_one :tree

- Validation - A location and only have one mycelia or tree.
- Positions could be like a chess board, or an incrementing number on a grid. e.g.

x-position
y-position

# Mycelium
- belongs_to :location
- has_many :hypha
- has_many :mushrooms
- has_many :spores, through :mushrooms
- has_many :requests

# Stores resources so must have a store for each resource

carbon sugar proteins nitrates

- first organism, first model to be created and spec'ed
- has a "Find Neighbours" method which will allow allow for symbiosis between mycelia & neighbouring tree --
- forms_symbiosis method allows to find a neighbouring tree and form association using << operator.
- Can also make it so that all mycelia know about their original mycelia making it the "mothership" by having a hierarchy

# Hyphae
- Mine nutrients from the soil
- Send nutrients C, N, P back to the stores in Mycelium
- belongs_to :mycelium

# Mushroom
- belongs_to :mycelium
- has_many :spores

# Tree
- belongs_to :location
- has_many :requests

- An original organism and primary vehicle for resource production.
- Trees produce sugars without which mycelia cannot product mushrooms or spores and therefore cannot expand into new territory.

# Request
- Means by which we facilitate the many to many relationship between mycelia and trees.
- Moves sugars and other resources between trees & mycelia.
- belongs_to :tree
- belongs_to :mycelium

## Turn Based Game ##
You start off with a mycelium. Each turn your store of resources in the mycelia can be used to perform certain functions
a) Produce Hyphae
b) Produce Mushrooms
c) (Only if Mushrooms exist) Release Spores --> This cannot happen in the same turn as a Mushroom being produced (and could possibly incur an extra cost?)
d) Send out request to Tree symbiotes --> This request will be fulfilled if the tree is able. Tree's are not-static objects but slowly accrue resources as time passes

To expand into new territory upon release of spores a chance element is introduced, a certain number of new mycelia are formed in a new location. These have no direct connection to the "mothership" but are still controlled by the player. The aim of the game is to connect all the trees in the forest by expanding your mycelia or it could be to send a message or flag or something from tree A to tree B, at either sides of a map. New mycelia are initialised on a random location within a 5x5 grid with original mycelia at the centre.

# Grid based Game

<p align="center">
<img src="https://s-media-cache-ak0.pinimg.com/236x/d7/47/33/d747337b43c19140c993e08d7c88fb50.jpg"/>
</p>


# Variables:

1. Element of chance can be introduced which could determine the likelihood of discovering nutrients
2. Once map-based, resource pockets can be discovered which contain different stores of nutrients. Seek and Replenish attitude.
3. Once a certain number of hyphae are produced a the current mycelium can expand into a neighbouring square on the grid (does this mean producing a second one?)

# Questions:

1. How do we establish a new relationship with a tree instance?
2. Can introduce events which can increase the overall store of the soil?
3. Multilayered grid system as a GOING DEEPER step --> hyphae are tiny.
4. What else to Trees produce and exchange with Fungi?
5. How do we introduce Time as a concept. Are turns a new model?

# Answers

- ON A SMALL SCALE, TURN BASED, RESOURCES ORIGINATE IN THE MYCELIA RELATIVE TO THE AMOUNT OF HYPHAE AND PERCENTAGE CHANCE OF DISCOVERING NUTRIENTS


# Fungi Facts to Integrate

Primary sources of energy / nutrients are Nitrate, glycerol (sugars), ammonia, acetate, & ethanol.
Increases uptake of Phosphates and Nitrates for symbiotes
Can transport carbohydrates between trees
Carbon appeared to be the limiting nutrient for fungal growth in both an agricultural soil and a forest humus soil.
Amatoxins
Bioluminescence and other cool skills
