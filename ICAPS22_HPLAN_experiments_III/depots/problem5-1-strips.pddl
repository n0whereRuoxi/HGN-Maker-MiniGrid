( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place941 - place
    hoist941 - hoist
    place857 - place
    hoist857 - hoist
    place893 - place
    hoist893 - hoist
    place0 - place
    hoist0 - hoist
    crate246 - surface
    pallet246 - surface
    crate188 - surface
    pallet188 - surface
    crate179 - surface
    pallet179 - surface
    crate977 - surface
    pallet977 - surface
    crate536 - surface
    pallet536 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist941 place941 )
    ( available hoist941 )
    ( hoist-at hoist857 place857 )
    ( available hoist857 )
    ( hoist-at hoist893 place893 )
    ( available hoist893 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet246 place857 )
    ( surface-at crate246 place857 )
    ( on crate246 pallet246 )
    ( is-crate crate246 )
    ( clear crate246 )
    ( surface-at pallet188 place941 )
    ( surface-at crate188 place941 )
    ( on crate188 pallet188 )
    ( is-crate crate188 )
    ( clear crate188 )
    ( surface-at pallet179 place893 )
    ( surface-at crate179 place893 )
    ( on crate179 pallet179 )
    ( is-crate crate179 )
    ( clear crate179 )
    ( surface-at pallet977 place941 )
    ( surface-at crate977 place941 )
    ( on crate977 pallet977 )
    ( is-crate crate977 )
    ( clear crate977 )
    ( surface-at pallet536 place857 )
    ( surface-at crate536 place857 )
    ( on crate536 pallet536 )
    ( is-crate crate536 )
    ( clear crate536 )
  )
  ( :goal
    ( and
    )
  )
)
