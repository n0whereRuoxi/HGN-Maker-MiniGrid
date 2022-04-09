( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place515 - place
    hoist515 - hoist
    place436 - place
    hoist436 - hoist
    place729 - place
    hoist729 - hoist
    place705 - place
    hoist705 - hoist
    place480 - place
    hoist480 - hoist
    place790 - place
    hoist790 - hoist
    place257 - place
    hoist257 - hoist
    place398 - place
    hoist398 - hoist
    place666 - place
    hoist666 - hoist
    place212 - place
    hoist212 - hoist
    place381 - place
    hoist381 - hoist
    place35 - place
    hoist35 - hoist
    place798 - place
    hoist798 - hoist
    place0 - place
    hoist0 - hoist
    crate209 - surface
    pallet209 - surface
    crate61 - surface
    pallet61 - surface
    crate820 - surface
    pallet820 - surface
    crate729 - surface
    pallet729 - surface
    crate93 - surface
    pallet93 - surface
    crate930 - surface
    pallet930 - surface
    crate417 - surface
    pallet417 - surface
    crate195 - surface
    pallet195 - surface
    crate260 - surface
    pallet260 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist515 place515 )
    ( available hoist515 )
    ( hoist-at hoist436 place436 )
    ( available hoist436 )
    ( hoist-at hoist729 place729 )
    ( available hoist729 )
    ( hoist-at hoist705 place705 )
    ( available hoist705 )
    ( hoist-at hoist480 place480 )
    ( available hoist480 )
    ( hoist-at hoist790 place790 )
    ( available hoist790 )
    ( hoist-at hoist257 place257 )
    ( available hoist257 )
    ( hoist-at hoist398 place398 )
    ( available hoist398 )
    ( hoist-at hoist666 place666 )
    ( available hoist666 )
    ( hoist-at hoist212 place212 )
    ( available hoist212 )
    ( hoist-at hoist381 place381 )
    ( available hoist381 )
    ( hoist-at hoist35 place35 )
    ( available hoist35 )
    ( hoist-at hoist798 place798 )
    ( available hoist798 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet209 place480 )
    ( surface-at crate209 place480 )
    ( on crate209 pallet209 )
    ( is-crate crate209 )
    ( clear crate209 )
    ( surface-at pallet61 place798 )
    ( surface-at crate61 place798 )
    ( on crate61 pallet61 )
    ( is-crate crate61 )
    ( clear crate61 )
    ( surface-at pallet820 place798 )
    ( surface-at crate820 place798 )
    ( on crate820 pallet820 )
    ( is-crate crate820 )
    ( clear crate820 )
    ( surface-at pallet729 place790 )
    ( surface-at crate729 place790 )
    ( on crate729 pallet729 )
    ( is-crate crate729 )
    ( clear crate729 )
    ( surface-at pallet93 place515 )
    ( surface-at crate93 place515 )
    ( on crate93 pallet93 )
    ( is-crate crate93 )
    ( clear crate93 )
    ( surface-at pallet930 place705 )
    ( surface-at crate930 place705 )
    ( on crate930 pallet930 )
    ( is-crate crate930 )
    ( clear crate930 )
    ( surface-at pallet417 place212 )
    ( surface-at crate417 place212 )
    ( on crate417 pallet417 )
    ( is-crate crate417 )
    ( clear crate417 )
    ( surface-at pallet195 place212 )
    ( surface-at crate195 place212 )
    ( on crate195 pallet195 )
    ( is-crate crate195 )
    ( clear crate195 )
    ( surface-at pallet260 place381 )
    ( surface-at crate260 place381 )
    ( on crate260 pallet260 )
    ( is-crate crate260 )
    ( clear crate260 )
  )
  ( :goal
    ( and
    )
  )
)
