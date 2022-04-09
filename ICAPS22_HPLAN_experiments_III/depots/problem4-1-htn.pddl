( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place739 - place
    hoist739 - hoist
    place611 - place
    hoist611 - hoist
    place676 - place
    hoist676 - hoist
    place741 - place
    hoist741 - hoist
    place199 - place
    hoist199 - hoist
    place378 - place
    hoist378 - hoist
    place0 - place
    hoist0 - hoist
    crate269 - surface
    pallet269 - surface
    crate759 - surface
    pallet759 - surface
    crate179 - surface
    pallet179 - surface
    crate354 - surface
    pallet354 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist739 place739 )
    ( available hoist739 )
    ( hoist-at hoist611 place611 )
    ( available hoist611 )
    ( hoist-at hoist676 place676 )
    ( available hoist676 )
    ( hoist-at hoist741 place741 )
    ( available hoist741 )
    ( hoist-at hoist199 place199 )
    ( available hoist199 )
    ( hoist-at hoist378 place378 )
    ( available hoist378 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet269 place378 )
    ( surface-at crate269 place378 )
    ( on crate269 pallet269 )
    ( is-crate crate269 )
    ( clear crate269 )
    ( surface-at pallet759 place611 )
    ( surface-at crate759 place611 )
    ( on crate759 pallet759 )
    ( is-crate crate759 )
    ( clear crate759 )
    ( surface-at pallet179 place611 )
    ( surface-at crate179 place611 )
    ( on crate179 pallet179 )
    ( is-crate crate179 )
    ( clear crate179 )
    ( surface-at pallet354 place676 )
    ( surface-at crate354 place676 )
    ( on crate354 pallet354 )
    ( is-crate crate354 )
    ( clear crate354 )
  )
  ( :tasks
    ( Make-4Crate crate269 crate759 crate179 crate354 l000 )
  )
)
