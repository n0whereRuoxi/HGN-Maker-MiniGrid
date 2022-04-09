( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place492 - place
    hoist492 - hoist
    place305 - place
    hoist305 - hoist
    place49 - place
    hoist49 - hoist
    place718 - place
    hoist718 - hoist
    place909 - place
    hoist909 - hoist
    place349 - place
    hoist349 - hoist
    place890 - place
    hoist890 - hoist
    place14 - place
    hoist14 - hoist
    place0 - place
    hoist0 - hoist
    crate169 - surface
    pallet169 - surface
    crate303 - surface
    pallet303 - surface
    crate160 - surface
    pallet160 - surface
    crate211 - surface
    pallet211 - surface
    crate548 - surface
    pallet548 - surface
    crate438 - surface
    pallet438 - surface
    crate399 - surface
    pallet399 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist492 place492 )
    ( available hoist492 )
    ( hoist-at hoist305 place305 )
    ( available hoist305 )
    ( hoist-at hoist49 place49 )
    ( available hoist49 )
    ( hoist-at hoist718 place718 )
    ( available hoist718 )
    ( hoist-at hoist909 place909 )
    ( available hoist909 )
    ( hoist-at hoist349 place349 )
    ( available hoist349 )
    ( hoist-at hoist890 place890 )
    ( available hoist890 )
    ( hoist-at hoist14 place14 )
    ( available hoist14 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet169 place492 )
    ( surface-at crate169 place492 )
    ( on crate169 pallet169 )
    ( is-crate crate169 )
    ( clear crate169 )
    ( surface-at pallet303 place305 )
    ( surface-at crate303 place305 )
    ( on crate303 pallet303 )
    ( is-crate crate303 )
    ( clear crate303 )
    ( surface-at pallet160 place492 )
    ( surface-at crate160 place492 )
    ( on crate160 pallet160 )
    ( is-crate crate160 )
    ( clear crate160 )
    ( surface-at pallet211 place718 )
    ( surface-at crate211 place718 )
    ( on crate211 pallet211 )
    ( is-crate crate211 )
    ( clear crate211 )
    ( surface-at pallet548 place890 )
    ( surface-at crate548 place890 )
    ( on crate548 pallet548 )
    ( is-crate crate548 )
    ( clear crate548 )
    ( surface-at pallet438 place49 )
    ( surface-at crate438 place49 )
    ( on crate438 pallet438 )
    ( is-crate crate438 )
    ( clear crate438 )
    ( surface-at pallet399 place349 )
    ( surface-at crate399 place349 )
    ( on crate399 pallet399 )
    ( is-crate crate399 )
    ( clear crate399 )
  )
  ( :goal
    ( and
    )
  )
)
