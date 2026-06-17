# Project Scout — Chapter 1 Full GDD
**Working Title:** Chapter 1: The Night of Ash
**Engine:** Godot 4 (GDScript)
**Genre:** Top-Down 2D Pixel Art Action RPG
**Art:** Pixel art — 320×180 native resolution, 16×16 tiles, 16×32 character sprites. Upscaled 4× to 720p / 6× to 1080p in Godot.

---

## Context

This document captures the complete game design for Chapter 1 of Project Scout. The repository is currently empty — Chapter 1 is the first playable build. It establishes all core systems (movement, melee, magic, hunger, taming, pets) and delivers the emotional throughline: a boy loses his world, survives alone, and bonds with his first companion.

**Note:** Project Scout is a spin-off of an existing webcomic. The Fader Leader and the main storyline belong to the webcomic's canon. This game explores a parallel/side story.

---

## World Lore — Conductor Abilities

Conductors are people who can use mana. Most have one of several **common abilities**. A rare few have **special/unique abilities**.

### Common Abilities (most conductors have one)
- **Taming** — bond with and command mana beasts
- **Fireball** — basic offensive mana projection
- **Healing** — mana-based restoration
- **Water magic** — water manipulation

### Special / Unique Abilities (extremely rare)
- **Teleportation** (The Betrayer) — can teleport anything he can see to anywhere he can see
- **Gravity manipulation** (Fader Leader) — his alone among all faders; no other fader has any power

### Kael's Ability
Kael is a **tamer** — taming is his core innate ability. He is a common conductor, not a special one. By the end of the game he becomes the most powerful tamer alive, but his foundation remains taming. The mentor teaches him fireball in Ch.1 as a basic combat skill — fireball is a common ability any conductor can learn; it is not Kael's specialty but a useful tool he can wield.

---

## World Lore — Shades

**Shades** are small concentrations of mana that form when a living body dies. They are the world's primary currency and energy source.

- **Beast shades:** Located in the stomach. Easy to extract. Commonly harvested — kill a beast, take the shade, spend it as money.
- **Human shades:** Located in the center of the brain. Require cracking open the skull to access. **No one in the general population knows human shades exist.** Only the Fader Leader has discovered this.
- **Power scaling:** The more shades a conductor collects, the stronger they become. Human shades yield significantly more power than beast shades.
- **The secret:** The Fader Leader knows human shades exist and has been quietly using this knowledge. The systematic killing of humans during fader invasions is not random violence — it is shade harvesting.

---

## World Lore — Faders

- Faders are humans corrupted by mana fallout from the original meteor impact (~600–700 years ago)
- They look human but are visibly wrong — not monsters, but something off about them
- **No special ability** — mindless, powerless, attack on instinct only
- They are **mindless** — no powers, no reasoning, pure instinct
- They are led by the Fader Leader, the only fader who retained consciousness and ability

---

## The Fader Leader's Plan

The Fader Leader's ultimate goal is to **undo the meteor impact** — to erase mana from the world entirely and return to the time before corruption.

**The method:**
1. Collect massive quantities of human shades by killing large populations
2. Use the accumulated shade-power (combined with gravity manipulation) to travel back in time to the exact moment the meteor approached the planet
3. At that moment, freeze time
4. Signal the Betrayer (who has a teleportation ability) to teleport the meteor out of the planet's atmosphere
5. Destroy the meteor before it can impact
6. Result: mana never enters the world → no faders → the Fader Leader (and all faders) are freed from their corruption

**Why the Fader Leader alone cares:** He is the only living being who remembers the world before mana. Everyone else alive was born into a mana-filled world and has no frame of reference for what was lost.

---

## Characters

| Character | Role | Notes |
|-----------|------|-------|
| **Kael** | Player (protagonist) | Young boy, sprite evolution Stage 1 of 4. Trained as a pottery craftsman (his father's trade) — the only non-warrior in a warrior family. Zero combat experience before Ch.1; everything the mentor teaches him is his first exposure to fighting and mana |
| **Kael's Father** | Craftsman / potter | Makes The Pot. A simple craftsman in a family of warriors |
| **Kael's Mother** | Village warrior | Fighter; part of the village's defense |
| **Kael's Older Siblings** | Warriors | Follow their mother's path; warriors like her |
| **Kael's Little Sister** | Child | 5 years old — the youngest in the family |
| **Mentor** | Guardian/teacher | Placeholder name. Has a jaguar companion. Stays behind during invasion — fate unknown until Ch.2 |
| **Mentor's Jaguar** | Mentor's pet | Saves Kael during escape. Dies in isolated area. Does NOT become player pet |
| **Village Chief** | Simple good man / conductor | Placeholder name. A respected tribesman with a teleportation ability. Found at the village outskirts near the wall. Not the betrayer — a genuinely good person |
| **The Betrayer** | Traitor — opens the village for faders | A simple villager with a teleportation ability (can teleport anything he can see to anywhere he can see). The Fader Leader found him and made him a deal: help execute the plan to undo the meteor and erase mana from the world. The Betrayer believes in this goal. He uses his ability to open passages in the village's defenses, letting the faders in. During the invasion he reveals himself and delivers the line: *"I'll bring you all back."* (He genuinely believes the plan will save/restore everyone) |
| **Faders** | Enemies | Corrupted humans — not monsters visually. Look human but wrong. **Mindless** — no powers, no reasoning. They swarm and attack on instinct |
| **Fader Leader** | Boss-tier antagonist | See lore section below |

### Fader Leader — Lore
- Approximately 600–700 years old; oldest living fader
- Originally a human survivor of the original meteor impact — the only living person who remembers the world before mana
- Was corrupted by mana fallout and became a fader
- A healing mana beast ate him whole; inside the beast he absorbed its healing factor and slowly reconstructed himself over centuries
- Spent hundreds of years as a prisoner of his own regenerating body before regaining consciousness and reasoning
- Now leads all faders; looks more "normal" than typical faders but is clearly still one of them
- The **only fader with a power** — gravity manipulation. All other faders are mindless and powerless
- Most powerful fader in existence
- His plan: erase the meteor impact from history (see *The Fader Leader's Plan* section above)
- **Ch.1 role:** Shadow silhouette only during the invasion — no dialogue, no confrontation. His identity is not revealed to the player in Ch.1

---

## Confirmed Dialogue

| Speaker | Line | Moment |
|---------|------|--------|
| Mentor | *"Hold the sword lower. You're not trying to impress the wood. You're trying to survive what hits back."* | Training quest |
| Mentor | *"If I tell you to run, you run. No questions."* | Invasion — final moment before sending Kael away |
| The Betrayer | *"I'll bring you all back."* | Invasion cutscene — reveals themselves |
| Kael | *"No… no, get up. You got me here. Please get up."* | Jaguar death scene |

---

## The 9 Pre-Invasion Quests

All quests trigger by talking to an NPC or entering a zone. Quest markers visible in Ch.1 (removed in later chapters for hidden quests).

| # | Quest Name | Trigger | Objective | System Taught |
|---|-----------|---------|-----------|---------------|
| 1 | **First Light** | Auto (game start) | Explore the village; talk to family members | Movement, NPC interaction |
| 2 | **Father's Trade** | Talk to Father | Help father with pottery; receive The Pot as keepsake | Interact button, inventory item |
| 3 | **Morning Training** | Talk to Mentor | Hit training dummy X times with wooden sword | Melee combat, 4-directional sword |
| 4 | **Herb Gathering** | Mentor sends player | Collect herbs from the riverside fields | Exploration, resource gathering |
| 5 | **Beast Care** | Talk to Mentor | Tend to Mentor's jaguar (feed it or groom it) | Pet interaction; Mentor explains taming |
| 6 | **Fire Within** | Mentor calls player | Cast fireball at training targets X times | Fireball, mana meter HUD |
| 7 | **Meet the Chief** | Quest marker → village outskirts | Find the Chief near the village wall — he has a teleportation ability and is there doing his own thing. Friendly, normal conversation; he's a respected and good man | World-building; player sees a conductor's ability in action |
| 8 | **A Helping Hand** | Elderly villager NPC | Fetch 1 medicine herb from the riverside fields (same area as Quest 4) and deliver it to an elderly villager | World-building, attachment to village |
| 9 | **The Hunt** | Mentor | Scripted hunt cutscene → taming rhythm minigame → bond baby pet; Mentor teaches pet commands | Taming, pet commands (Follow/Attack/Stay/Recall/Scout) |

After quest 9 completes → Invasion triggers automatically.

### The Pot
- A keepsake item crafted by Kael's father (master potter)
- Kael always carries it — it represents home and family
- No combat use in Ch.1; emotional/narrative weight

### Taming Minigame (Quest 9 — The Hunt)
- Scripted cutscene: Mentor and Kael track a mana beast; Mentor lands the hunt
- Baby mana beast revealed in the den
- Taming minigame: rhythmic Guitar Hero-style — scrolling note track, player hits inputs to match
- Successful rhythm = bond formed, baby pet joins Kael
- Mentor then teaches pet commands as a tutorial

---

## Invasion Sequence (Phase 2)

**Trigger:** All 9 quests complete.

**Layout:** Village is cornered in the game world map (one corner against the map boundary). The ONLY exit is a bridge crossing the river.

**Sequence:**
1. Invasion cutscene — faders flood in from the far corner of the village (opposite the bridge)
2. Chaos: NPCs running, buildings on fire, faders spreading
3. **The Betrayer** steps forward — he used his teleportation ability to open passages in the village's defenses for the faders. He reveals himself and delivers the line: *"I'll bring you all back."* He is not a villain to himself — he believes in the Fader Leader's plan
4. Player + Mentor fight through (brief skirmish — player is weak, Mentor carries the fight)
5. They reach the bridge — faders swarming behind them
6. Mentor puts Kael on the jaguar's back → line: *"If I tell you to run, you run. No questions."*
7. Tells jaguar to RUN
8. Jaguar sprints across the bridge with Kael
9. Faders flood onto the bridge chasing them — the bridge collapses under their weight
10. Mentor is left on the village side — screen cuts as bridge falls

**Mentor's fate:** Unknown within Ch.1. In Ch.2 Kael discovers the entire village died, implying the mentor died too.

---

## Isolated Area (Phase 3)

Kael is alone on the far side of the collapsed bridge. The jaguar is badly wounded.

### Zones
| Zone | Description |
|------|-------------|
| Landing Point | Where jaguar drops Kael after crossing |
| Jaguar's Rest | Small clearing — jaguar collapses and dies here |
| Foraging Zone | All food sources: berries/mushrooms (gather), fruit/wild plants (collect), small animals (hunt with fireball), fish from a nearby stream/pool (catch) |
| Mana Practice Spot | Open area or ruined shrine — fireball practice targets |
| Area Exit | Path out — triggers Ch.2 transition |

### Events in Order
1. **Arrival** — Jaguar collapses near the landing point
2. **Death scene** — Jaguar dies; Kael's line plays: *"No… no, get up. You got me here. Please get up."*
3. **Survive the Night** — Hunger meter activates; Kael must gather food from Foraging Zone
4. **Mana Focus** — Practice fireball in the Mana Practice Spot
5. **Bond Grows** — Baby pet uses its newly-learned commands; short interaction beats showing growing trust
6. **New Path** — Kael and baby pet leave the isolated area → Chapter 2 title card: *"Chapter 2: Survive"*

---

## Village Map

**Structure:** Single scrolling map (no hard screen transitions between most zones). Approximately 12 distinct areas.

### Key Zones
| Zone | Role |
|------|------|
| Village Center | Well, market stalls, NPCs gathering — heart of the village |
| Residential Area | Family huts including Kael's home; meet family in Quest 1 |
| Father's Workshop | Potter's area where The Pot is made (Quest 2) |
| Training Yard | Wooden dummies, open space near Mentor's area (Quest 3) |
| Mentor's Hut | Mentor's home + jaguar pen (Quests 3, 5, 6, 9) |
| Herb/Riverside Fields | Near the river — gathering zone (Quest 4) |
| River + Bridge | The only exit from the village; key to invasion escape |
| Village Outskirts / Wall | Chief is found here (Quest 7); edge of the village |
| Village Hunt Area | Beyond the village boundary — where The Hunt takes place (Quest 9) |
| Village Gate/Corner | Where faders invade from — far corner from the bridge |

---

## Combat & Controls

| Input | Action |
|-------|--------|
| WASD | Move |
| Mouse | Aim |
| Left Click | Wooden sword (4-directional melee swing, hitbox in front) |
| Right Click | Fireball (travels toward mouse cursor) |
| E | Interact (NPC dialogue, item pickup, etc.) |
| Tab (or similar) | Pet command menu |

**Training Dummy:** Interactive prop with visual hit feedback (animation/flash when struck).

---

## HUD Layout

All bars displayed bottom-center, horizontal:

```
[ HP ████████░░ ] [ MANA ██████░░░░ ] [ HUNGER ████░░░░░░ ]
```

- HP bar: always visible once tutorial starts
- Mana bar: appears when fireball is learned (Quest 6)
- Hunger bar: appears when player reaches isolated area (Phase 3)
- Quest markers: compass-style + world markers visible in Ch.1

---

## Pets

### Build Selection Screen (Game Start)
Before Chapter 1 begins, the player chooses a **starting build**. All three builds share **taming as their core ability** (Kael is always a tamer). The build changes his magic strength, taming tree access, and beast affinity.

| Build | Magic | Taming Tree | Beast Affinity | Pet Species | Pairing Logic |
|-------|-------|------------|----------------|-------------|--------------|
| **Mage** | Strong | **Sealed** — cannot unlock new taming abilities | Balanced | **Ocelot** (Combat) | Powerful magic + combat pet for physical damage; taming doesn't grow |
| **Warrior** | Weak | **Full access** — complete taming ability tree | Healing/docile beasts — combat beasts are nearly impossible to tame | **White-Tailed Deer** (Healing) | Physical fighter sustained by healing pet; best tamer but limited to gentle beasts |
| **Weakling** | Weak | Partial | Mixed — everything is hard until a level threshold (TBD) | **Gray Fox** (Mesh) | Struggles at everything early; highest ceiling of all three builds past the threshold |

### Pet Details

| Species | Role | Notes |
|---------|------|-------|
| **Ocelot** | Combat Pet | High damage, aggressive. Offensive powerhouse |
| **White-Tailed Deer** | Healing/Buff Pet | No combat ability. 50 HP restore, applies buffs. Pure support |
| **Gray Fox** | Mesh Pet | Low combat AND low healing early. Scales faster than others; unlocks a unique ability in later chapters. The "secret best" option |

**Taming:** The chosen build's beast appears as the baby in The Hunt den. Player tames via rhythm minigame. Player names the pet at the moment of taming. The other two species do not appear anywhere in the game world.

### Pet Commands (taught by Mentor in Quest 9)

| Command | Behavior |
|---------|---------|
| **Follow** | Pet trails Kael at a close fixed distance |
| **Stay** | Pet holds position — does not move from spot |
| **Scout** | Pet roams freely ahead; moves independently, alerts to enemies |
| **Recall** | Pet returns close to Kael but keeps some freedom of movement (not locked to player) |
| **Attack** | Pet engages enemies using its combat style (see below) |

### Pet Combat AI (in Attack mode)

| Pet | Combat Behavior |
|-----|----------------|
| **Ocelot** | Closes distance and fights in melee — stays in the fight, high aggression |
| **White-Tailed Deer** | Avoids taking damage by staying mobile; stays close enough to heal and buff Kael; can still be hit (not perfect avoidance) |
| **Gray Fox** | Engages enemies when HP is high; retreats and disengages when HP drops low — leaves Kael temporarily without support until it recovers |

---

## Gameplay Systems — Introduction Order

| System | First Introduced |
|--------|----------------|
| Basic movement | Quest 1 (auto) |
| NPC interaction / dialogue | Quest 1 |
| Inventory (keepsake) | Quest 2 |
| Wooden sword melee | Quest 3 |
| Resource gathering | Quest 4 |
| Pet interaction | Quest 5 |
| Fireball + mana meter | Quest 6 |
| Taming minigame | Quest 9 |
| Pet commands | Quest 9 |
| Hunger meter | Isolated area |
| Emotional narrative beats | Jaguar death scene |

---

## Technical Spec

### Game State Machine
The game moves through these states in order:
```
MAIN_MENU → BUILD_SELECTION → VILLAGE_PHASE → INVASION_CUTSCENE → ESCAPE_PHASE → ISOLATED_AREA → CH2_TRANSITION
```
A `GameManager` autoload singleton holds the current state and handles transitions.

### Player Stats (Ch.1 starting values)
| Stat | Value | Notes |
|------|-------|-------|
| HP | 100 | Full health at start |
| Mana | 60 | Full mana at start |
| Fireball cost | 15 mana | Per cast |
| Mana regen | 5 / second | Passive; slow recovery |
| Movement speed | 80 px/s | ~5 tiles/second at 16px tile scale |
| Sword damage | 20 | Per hit |
| Fireball damage | 30 | Per projectile |
| Invincibility frames | 0.5 seconds | After taking a hit |

### Death / Checkpoint System
- HP reaches 0 → **restart at last autosave** (most recently completed quest)
- Autosave triggers at the END of each quest completion
- Autosave stores: current quest index, player position, inventory state
- No death is possible during pure cutscene phases (player input is locked)

### Enemy Stats — Fader (Ch.1)
| Stat | Value |
|------|-------|
| HP | 40 |
| Damage per hit | 15 |
| Movement speed | 50 px/s (slower than player) |
| Sight radius | 5 tiles |

**Fader AI state machine:**
```
IDLE → (player enters sight radius) → CHASE → (adjacent to player) → ATTACK → CHASE → ...
DEAD (HP = 0)
```
Faders do not use ranged attacks. They swarm on instinct — no coordination, no tactics.

### Hunger System (Isolated Area only)
| Parameter | Value |
|-----------|-------|
| Starting hunger | 100 |
| Passive drain | 2 per minute |
| At 0 hunger | HP drains 1 per 5 seconds until food is eaten |

**Food restoration:**
| Food | Hunger restored |
|------|----------------|
| Berries / mushrooms | +15 |
| Fruit / wild plants | +20 |
| Small animals (fireball hunt) | +35 |
| Fish (catch from stream) | +40 |

### Pet (Ch.1)
- Baby pet does **not fight** in Ch.1 — it takes no damage and deals no damage
- Pet is effectively invincible in Ch.1
- Pet commands are functional (Follow/Stay/Scout/Recall) but Attack command does nothing yet
- Pet HP and combat systems activate in Ch.2+

### Taming Minigame
| Parameter | Value |
|-----------|-------|
| Input keys | Arrow keys (Up / Down / Left / Right) |
| Note count | 8–12 notes per attempt |
| Fail state (Ch.1) | Baby retreats — player can retry immediately, unlimited attempts |
| Fail state (Ch.2+) | **One shot only** — beast escapes permanently if minigame is failed |

### Quest Completion Triggers
| Quest | Completion condition |
|-------|---------------------|
| 1 — First Light | Talk to all family members (Father, Mother, at least 1 sibling, Little Sister) |
| 2 — Father's Trade | Complete pottery interaction → receive The Pot in inventory |
| 3 — Morning Training | Hit the training dummy **5 times** |
| 4 — Herb Gathering | Collect **5 herbs** from the riverside fields |
| 5 — Beast Care | Complete the jaguar care interaction (feed or groom — single action) |
| 6 — Fire Within | Hit fireball targets **5 times** |
| 7 — Meet the Chief | Reach the Chief and complete his dialogue |
| 8 — A Helping Hand | Collect 1 medicine herb from the fields → deliver to elderly villager |
| 9 — The Hunt | Complete the taming minigame successfully |

### Dialogue System
- **Advance:** E key or Spacebar
- **All Ch.1 dialogue is linear** — no player choices
- Dialogue pauses the game world (NPCs and enemies freeze while a dialogue box is open)
- No cutscene skip in Ch.1 (first-time experience)

### Audio Plan
| Area / Moment | Music Direction | Style |
|---------------|----------------|-------|
| Village (quests 1–9) | Warm, tribal/folk feel | Flutes, light percussion, gentle rhythm |
| Invasion | Urgent, tense | Heavy percussion, fast tempo, dissonance |
| Isolated Area | Quiet and lonely | Minimal — single instrument or ambient only |
| Taming minigame | Rhythmic cue track | Synced to the note input sequence |
| Jaguar death scene | Silence or faint ambient | Let the dialogue carry the moment |

**Sound effects needed (full list for implementation):**
- Footstep (dirt/grass)
- Sword swing
- Sword hit (dummy / fader)
- Fireball cast
- Fireball impact
- Player hurt
- Player death (fade/thud)
- Item pickup (herb, food)
- Quest complete chime
- NPC dialogue blip
- Taming note hit (success)
- Taming note miss (fail)
- Bridge collapse rumble
- Jaguar death (soft, emotional)

### Camera
- `Camera2D` with smooth follow (lerp smoothing)
- Hard limits at map boundaries (camera never shows outside the map)
- No zoom changes during normal gameplay
- During cutscenes: camera may pan to specific characters/locations

### Collision Layers
| Layer | Used for |
|-------|---------|
| 1 — World | Walls, buildings, river, bridge |
| 2 — Player | Kael |
| 3 — Enemies | Faders |
| 4 — NPCs | Villagers, Mentor, Chief, Jaguar |
| 5 — Interactables | Herbs, dummies, food, NPC interaction zones |
| 6 — Pet | Baby pet |
| 7 — Projectiles | Fireball |

### Phase Transitions
All phase transitions use a **0.5s fade to black** then fade back in at the new location/state.

| Transition | Trigger |
|-----------|---------|
| Build Selection → Village | Player confirms build choice |
| Village → Invasion | Quest 9 completes |
| Invasion → Isolated Area | Bridge collapse cutscene ends |
| Isolated Area → Ch.2 | Kael exits the area through the exit point |

---



```
scenes/
  menus/
    BuildSelection.tscn       # Pre-Ch.1 beast picker — Gray Fox / White-Tailed Deer / Ocelot
  village/
    VillageMap.tscn           # Main village (single scrolling map)
    IsolatedArea.tscn         # Survival area (post-escape)
  characters/
    Player.tscn               # Kael — PlayerController, SpriteEvolution (stage 1)
    Mentor.tscn               # NPC with dialogue tree, quest-giver
    MentorJaguar.tscn         # AI escort → death sequence
    Villager.tscn             # Reusable NPC template
    ChiefNPC.tscn             # Quest 7 interaction
    Betrayer.tscn             # Invasion cutscene NPC
    Fader.tscn                # Enemy type — basic AI
  pets/
    CombatPet.tscn            # Ocelot
    HealingPet.tscn           # White-Tailed Deer
    MeshPet.tscn              # Gray Fox
  systems/
    QuestManager.tscn         # Autoload singleton — boolean flags per quest
    HungerSystem.tscn         # Drain rate, food restore, HUD binding
    TamingMinigame.tscn       # Rhythm input controller
    PetCommandSystem.tscn     # Follow/Stay/Attack/Recall/Scout + per-pet combat AI
  ui/
    HUD.tscn                  # HP + Mana + Hunger bars (bottom-center)
    QuestMarker.tscn          # World-space quest indicators
    DialogueBox.tscn          # On-screen NPC dialogue with character movement
  cutscenes/
    InvasionCutscene.tscn     # Characters move on-screen + dialogue panels
    JaguarDeathScene.tscn     # Emotional beat — Kael's line
    BridgeCollapse.tscn       # Bridge destruction sequence
```

### Quest State Machine
Autoload `QuestManager` singleton tracks boolean flags:
```
quest_1_started / quest_1_complete
quest_2_started / quest_2_complete
...
quest_9_complete → invasion_trigger = true
```

---

## Remaining Placeholders

| Item | Status |
|------|--------|
| Pixel art resolution + tile size | **320×180 / 16×16 tiles / 16×32 characters** ✓ |
| Mentor's name | TBD |
| Chief's name | TBD |
| Betrayer's identity / method | TBD |
| Hunger drain rate | TBD — playtest |
| Food types in isolated area | TBD — berries, mushrooms, small animals (suggested) |
| Exact fader count in escape | TBD — balance in playtest |
| Fader Leader's Ch.1 appearance | TBD — cameo or cut entirely until Ch.2 |

---

## Verification Checklist

- [ ] Player (Kael) can roam village and talk to all NPCs
- [ ] Quest 1–9 trigger and complete in correct sequence
- [ ] The Pot appears in inventory after Quest 2
- [ ] Training dummy responds to sword hits with visual feedback
- [ ] Fireball travels toward mouse cursor
- [ ] Mana bar appears only after Quest 6
- [ ] Taming rhythm minigame launches, accepts input, and bonds pet on success
- [ ] Pet responds to all 5 commands post-taming
- [ ] Pet combat AI matches species behavior (Ocelot melee-aggressive, Deer mobile-support, Fox engage-retreat)
- [ ] Invasion triggers after Quest 9 completes (not before)
- [ ] Betrayer's line fires at correct invasion cutscene moment
- [ ] Bridge collapse sequence plays correctly
- [ ] Kael arrives in isolated area alone (mentor not present)
- [ ] Jaguar death scene fires; Kael's dialogue line plays
- [ ] Hunger meter activates in isolated area
- [ ] Food gathering restores hunger
- [ ] Chapter 2 title card plays when Kael exits the isolated area
