( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place991 - place
    hoist991 - hoist
    place929 - place
    hoist929 - hoist
    place320 - place
    hoist320 - hoist
    place231 - place
    hoist231 - hoist
    place273 - place
    hoist273 - hoist
    place510 - place
    hoist510 - hoist
    place926 - place
    hoist926 - hoist
    place792 - place
    hoist792 - hoist
    place491 - place
    hoist491 - hoist
    place841 - place
    hoist841 - hoist
    place0 - place
    hoist0 - hoist
    crate291 - surface
    pallet291 - surface
    crate823 - surface
    pallet823 - surface
    crate835 - surface
    pallet835 - surface
    crate152 - surface
    pallet152 - surface
    crate992 - surface
    pallet992 - surface
    crate747 - surface
    pallet747 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist991 place991 )
    ( available hoist991 )
    ( hoist-at hoist929 place929 )
    ( available hoist929 )
    ( hoist-at hoist320 place320 )
    ( available hoist320 )
    ( hoist-at hoist231 place231 )
    ( available hoist231 )
    ( hoist-at hoist273 place273 )
    ( available hoist273 )
    ( hoist-at hoist510 place510 )
    ( available hoist510 )
    ( hoist-at hoist926 place926 )
    ( available hoist926 )
    ( hoist-at hoist792 place792 )
    ( available hoist792 )
    ( hoist-at hoist491 place491 )
    ( available hoist491 )
    ( hoist-at hoist841 place841 )
    ( available hoist841 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet291 place273 )
    ( surface-at crate291 place273 )
    ( on crate291 pallet291 )
    ( is-crate crate291 )
    ( clear crate291 )
    ( surface-at pallet823 place231 )
    ( surface-at crate823 place231 )
    ( on crate823 pallet823 )
    ( is-crate crate823 )
    ( clear crate823 )
    ( surface-at pallet835 place926 )
    ( surface-at crate835 place926 )
    ( on crate835 pallet835 )
    ( is-crate crate835 )
    ( clear crate835 )
    ( surface-at pallet152 place510 )
    ( surface-at crate152 place510 )
    ( on crate152 pallet152 )
    ( is-crate crate152 )
    ( clear crate152 )
    ( surface-at pallet992 place841 )
    ( surface-at crate992 place841 )
    ( on crate992 pallet992 )
    ( is-crate crate992 )
    ( clear crate992 )
    ( surface-at pallet747 place926 )
    ( surface-at crate747 place926 )
    ( on crate747 pallet747 )
    ( is-crate crate747 )
    ( clear crate747 )
  )
  ( :goal
    ( and
    )
  )
)
