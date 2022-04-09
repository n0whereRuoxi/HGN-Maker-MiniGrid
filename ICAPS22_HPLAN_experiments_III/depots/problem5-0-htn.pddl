( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place705 - place
    hoist705 - hoist
    place453 - place
    hoist453 - hoist
    place0 - place
    hoist0 - hoist
    crate708 - surface
    pallet708 - surface
    crate487 - surface
    pallet487 - surface
    crate926 - surface
    pallet926 - surface
    crate12 - surface
    pallet12 - surface
    crate788 - surface
    pallet788 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist705 place705 )
    ( available hoist705 )
    ( hoist-at hoist453 place453 )
    ( available hoist453 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet708 place705 )
    ( surface-at crate708 place705 )
    ( on crate708 pallet708 )
    ( is-crate crate708 )
    ( clear crate708 )
    ( surface-at pallet487 place453 )
    ( surface-at crate487 place453 )
    ( on crate487 pallet487 )
    ( is-crate crate487 )
    ( clear crate487 )
    ( surface-at pallet926 place453 )
    ( surface-at crate926 place453 )
    ( on crate926 pallet926 )
    ( is-crate crate926 )
    ( clear crate926 )
    ( surface-at pallet12 place453 )
    ( surface-at crate12 place453 )
    ( on crate12 pallet12 )
    ( is-crate crate12 )
    ( clear crate12 )
    ( surface-at pallet788 place453 )
    ( surface-at crate788 place453 )
    ( on crate788 pallet788 )
    ( is-crate crate788 )
    ( clear crate788 )
  )
  ( :tasks
    ( Make-5Crate crate708 crate487 crate926 crate12 crate788 l000 )
  )
)
