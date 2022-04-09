( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place862 - place
    hoist862 - hoist
    place813 - place
    hoist813 - hoist
    place265 - place
    hoist265 - hoist
    place574 - place
    hoist574 - hoist
    place728 - place
    hoist728 - hoist
    place354 - place
    hoist354 - hoist
    place518 - place
    hoist518 - hoist
    place80 - place
    hoist80 - hoist
    place580 - place
    hoist580 - hoist
    place901 - place
    hoist901 - hoist
    place500 - place
    hoist500 - hoist
    place916 - place
    hoist916 - hoist
    place777 - place
    hoist777 - hoist
    place868 - place
    hoist868 - hoist
    place243 - place
    hoist243 - hoist
    place0 - place
    hoist0 - hoist
    crate814 - surface
    pallet814 - surface
    crate545 - surface
    pallet545 - surface
    crate576 - surface
    pallet576 - surface
    crate68 - surface
    pallet68 - surface
    crate726 - surface
    pallet726 - surface
    crate381 - surface
    pallet381 - surface
    crate884 - surface
    pallet884 - surface
    crate587 - surface
    pallet587 - surface
    crate556 - surface
    pallet556 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist862 place862 )
    ( available hoist862 )
    ( hoist-at hoist813 place813 )
    ( available hoist813 )
    ( hoist-at hoist265 place265 )
    ( available hoist265 )
    ( hoist-at hoist574 place574 )
    ( available hoist574 )
    ( hoist-at hoist728 place728 )
    ( available hoist728 )
    ( hoist-at hoist354 place354 )
    ( available hoist354 )
    ( hoist-at hoist518 place518 )
    ( available hoist518 )
    ( hoist-at hoist80 place80 )
    ( available hoist80 )
    ( hoist-at hoist580 place580 )
    ( available hoist580 )
    ( hoist-at hoist901 place901 )
    ( available hoist901 )
    ( hoist-at hoist500 place500 )
    ( available hoist500 )
    ( hoist-at hoist916 place916 )
    ( available hoist916 )
    ( hoist-at hoist777 place777 )
    ( available hoist777 )
    ( hoist-at hoist868 place868 )
    ( available hoist868 )
    ( hoist-at hoist243 place243 )
    ( available hoist243 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet814 place813 )
    ( surface-at crate814 place813 )
    ( on crate814 pallet814 )
    ( is-crate crate814 )
    ( clear crate814 )
    ( surface-at pallet545 place916 )
    ( surface-at crate545 place916 )
    ( on crate545 pallet545 )
    ( is-crate crate545 )
    ( clear crate545 )
    ( surface-at pallet576 place500 )
    ( surface-at crate576 place500 )
    ( on crate576 pallet576 )
    ( is-crate crate576 )
    ( clear crate576 )
    ( surface-at pallet68 place916 )
    ( surface-at crate68 place916 )
    ( on crate68 pallet68 )
    ( is-crate crate68 )
    ( clear crate68 )
    ( surface-at pallet726 place728 )
    ( surface-at crate726 place728 )
    ( on crate726 pallet726 )
    ( is-crate crate726 )
    ( clear crate726 )
    ( surface-at pallet381 place574 )
    ( surface-at crate381 place574 )
    ( on crate381 pallet381 )
    ( is-crate crate381 )
    ( clear crate381 )
    ( surface-at pallet884 place574 )
    ( surface-at crate884 place574 )
    ( on crate884 pallet884 )
    ( is-crate crate884 )
    ( clear crate884 )
    ( surface-at pallet587 place728 )
    ( surface-at crate587 place728 )
    ( on crate587 pallet587 )
    ( is-crate crate587 )
    ( clear crate587 )
    ( surface-at pallet556 place574 )
    ( surface-at crate556 place574 )
    ( on crate556 pallet556 )
    ( is-crate crate556 )
    ( clear crate556 )
  )
  ( :tasks
    ( Make-9Crate pallet0 crate814 crate545 crate576 crate68 crate726 crate381 crate884 crate587 crate556 )
  )
)
