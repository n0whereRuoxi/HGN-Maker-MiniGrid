( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place913 - place
    hoist913 - hoist
    place214 - place
    hoist214 - hoist
    place173 - place
    hoist173 - hoist
    place687 - place
    hoist687 - hoist
    place270 - place
    hoist270 - hoist
    place709 - place
    hoist709 - hoist
    place139 - place
    hoist139 - hoist
    place789 - place
    hoist789 - hoist
    place161 - place
    hoist161 - hoist
    place499 - place
    hoist499 - hoist
    place763 - place
    hoist763 - hoist
    place185 - place
    hoist185 - hoist
    place457 - place
    hoist457 - hoist
    place984 - place
    hoist984 - hoist
    place551 - place
    hoist551 - hoist
    place0 - place
    hoist0 - hoist
    crate154 - surface
    pallet154 - surface
    crate191 - surface
    pallet191 - surface
    crate343 - surface
    pallet343 - surface
    crate445 - surface
    pallet445 - surface
    crate688 - surface
    pallet688 - surface
    crate138 - surface
    pallet138 - surface
    crate230 - surface
    pallet230 - surface
    crate530 - surface
    pallet530 - surface
    crate251 - surface
    pallet251 - surface
    crate659 - surface
    pallet659 - surface
    crate611 - surface
    pallet611 - surface
    crate755 - surface
    pallet755 - surface
    crate702 - surface
    pallet702 - surface
    crate880 - surface
    pallet880 - surface
    crate25 - surface
    pallet25 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist913 place913 )
    ( available hoist913 )
    ( hoist-at hoist214 place214 )
    ( available hoist214 )
    ( hoist-at hoist173 place173 )
    ( available hoist173 )
    ( hoist-at hoist687 place687 )
    ( available hoist687 )
    ( hoist-at hoist270 place270 )
    ( available hoist270 )
    ( hoist-at hoist709 place709 )
    ( available hoist709 )
    ( hoist-at hoist139 place139 )
    ( available hoist139 )
    ( hoist-at hoist789 place789 )
    ( available hoist789 )
    ( hoist-at hoist161 place161 )
    ( available hoist161 )
    ( hoist-at hoist499 place499 )
    ( available hoist499 )
    ( hoist-at hoist763 place763 )
    ( available hoist763 )
    ( hoist-at hoist185 place185 )
    ( available hoist185 )
    ( hoist-at hoist457 place457 )
    ( available hoist457 )
    ( hoist-at hoist984 place984 )
    ( available hoist984 )
    ( hoist-at hoist551 place551 )
    ( available hoist551 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet154 place457 )
    ( surface-at crate154 place457 )
    ( on crate154 pallet154 )
    ( is-crate crate154 )
    ( clear crate154 )
    ( surface-at pallet191 place687 )
    ( surface-at crate191 place687 )
    ( on crate191 pallet191 )
    ( is-crate crate191 )
    ( clear crate191 )
    ( surface-at pallet343 place709 )
    ( surface-at crate343 place709 )
    ( on crate343 pallet343 )
    ( is-crate crate343 )
    ( clear crate343 )
    ( surface-at pallet445 place185 )
    ( surface-at crate445 place185 )
    ( on crate445 pallet445 )
    ( is-crate crate445 )
    ( clear crate445 )
    ( surface-at pallet688 place173 )
    ( surface-at crate688 place173 )
    ( on crate688 pallet688 )
    ( is-crate crate688 )
    ( clear crate688 )
    ( surface-at pallet138 place161 )
    ( surface-at crate138 place161 )
    ( on crate138 pallet138 )
    ( is-crate crate138 )
    ( clear crate138 )
    ( surface-at pallet230 place499 )
    ( surface-at crate230 place499 )
    ( on crate230 pallet230 )
    ( is-crate crate230 )
    ( clear crate230 )
    ( surface-at pallet530 place139 )
    ( surface-at crate530 place139 )
    ( on crate530 pallet530 )
    ( is-crate crate530 )
    ( clear crate530 )
    ( surface-at pallet251 place709 )
    ( surface-at crate251 place709 )
    ( on crate251 pallet251 )
    ( is-crate crate251 )
    ( clear crate251 )
    ( surface-at pallet659 place214 )
    ( surface-at crate659 place214 )
    ( on crate659 pallet659 )
    ( is-crate crate659 )
    ( clear crate659 )
    ( surface-at pallet611 place709 )
    ( surface-at crate611 place709 )
    ( on crate611 pallet611 )
    ( is-crate crate611 )
    ( clear crate611 )
    ( surface-at pallet755 place457 )
    ( surface-at crate755 place457 )
    ( on crate755 pallet755 )
    ( is-crate crate755 )
    ( clear crate755 )
    ( surface-at pallet702 place173 )
    ( surface-at crate702 place173 )
    ( on crate702 pallet702 )
    ( is-crate crate702 )
    ( clear crate702 )
    ( surface-at pallet880 place185 )
    ( surface-at crate880 place185 )
    ( on crate880 pallet880 )
    ( is-crate crate880 )
    ( clear crate880 )
    ( surface-at pallet25 place270 )
    ( surface-at crate25 place270 )
    ( on crate25 pallet25 )
    ( is-crate crate25 )
    ( clear crate25 )
  )
  ( :goal
    ( and
    )
  )
)
