( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place915 - place
    hoist915 - hoist
    place335 - place
    hoist335 - hoist
    place394 - place
    hoist394 - hoist
    place688 - place
    hoist688 - hoist
    place355 - place
    hoist355 - hoist
    place758 - place
    hoist758 - hoist
    place0 - place
    hoist0 - hoist
    crate123 - surface
    pallet123 - surface
    crate32 - surface
    pallet32 - surface
    crate992 - surface
    pallet992 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist915 place915 )
    ( available hoist915 )
    ( hoist-at hoist335 place335 )
    ( available hoist335 )
    ( hoist-at hoist394 place394 )
    ( available hoist394 )
    ( hoist-at hoist688 place688 )
    ( available hoist688 )
    ( hoist-at hoist355 place355 )
    ( available hoist355 )
    ( hoist-at hoist758 place758 )
    ( available hoist758 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet123 place688 )
    ( surface-at crate123 place688 )
    ( on crate123 pallet123 )
    ( is-crate crate123 )
    ( clear crate123 )
    ( surface-at pallet32 place758 )
    ( surface-at crate32 place758 )
    ( on crate32 pallet32 )
    ( is-crate crate32 )
    ( clear crate32 )
    ( surface-at pallet992 place355 )
    ( surface-at crate992 place355 )
    ( on crate992 pallet992 )
    ( is-crate crate992 )
    ( clear crate992 )
  )
  ( :goal
    ( and
    )
  )
)
