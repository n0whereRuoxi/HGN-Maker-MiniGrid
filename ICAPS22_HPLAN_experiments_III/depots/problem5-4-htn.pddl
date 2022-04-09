( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place686 - place
    hoist686 - hoist
    place937 - place
    hoist937 - hoist
    place25 - place
    hoist25 - hoist
    place476 - place
    hoist476 - hoist
    place54 - place
    hoist54 - hoist
    place285 - place
    hoist285 - hoist
    place14 - place
    hoist14 - hoist
    place813 - place
    hoist813 - hoist
    place197 - place
    hoist197 - hoist
    place0 - place
    hoist0 - hoist
    crate973 - surface
    pallet973 - surface
    crate664 - surface
    pallet664 - surface
    crate718 - surface
    pallet718 - surface
    crate246 - surface
    pallet246 - surface
    crate713 - surface
    pallet713 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist686 place686 )
    ( available hoist686 )
    ( hoist-at hoist937 place937 )
    ( available hoist937 )
    ( hoist-at hoist25 place25 )
    ( available hoist25 )
    ( hoist-at hoist476 place476 )
    ( available hoist476 )
    ( hoist-at hoist54 place54 )
    ( available hoist54 )
    ( hoist-at hoist285 place285 )
    ( available hoist285 )
    ( hoist-at hoist14 place14 )
    ( available hoist14 )
    ( hoist-at hoist813 place813 )
    ( available hoist813 )
    ( hoist-at hoist197 place197 )
    ( available hoist197 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet973 place197 )
    ( surface-at crate973 place197 )
    ( on crate973 pallet973 )
    ( is-crate crate973 )
    ( clear crate973 )
    ( surface-at pallet664 place285 )
    ( surface-at crate664 place285 )
    ( on crate664 pallet664 )
    ( is-crate crate664 )
    ( clear crate664 )
    ( surface-at pallet718 place813 )
    ( surface-at crate718 place813 )
    ( on crate718 pallet718 )
    ( is-crate crate718 )
    ( clear crate718 )
    ( surface-at pallet246 place476 )
    ( surface-at crate246 place476 )
    ( on crate246 pallet246 )
    ( is-crate crate246 )
    ( clear crate246 )
    ( surface-at pallet713 place285 )
    ( surface-at crate713 place285 )
    ( on crate713 pallet713 )
    ( is-crate crate713 )
    ( clear crate713 )
  )
  ( :tasks
    ( Make-5Crate crate973 crate664 crate718 crate246 crate713 l000 )
  )
)
