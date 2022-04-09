( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place724 - place
    hoist724 - hoist
    place871 - place
    hoist871 - hoist
    place0 - place
    hoist0 - hoist
    crate978 - surface
    pallet978 - surface
    crate776 - surface
    pallet776 - surface
    crate109 - surface
    pallet109 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist724 place724 )
    ( available hoist724 )
    ( hoist-at hoist871 place871 )
    ( available hoist871 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet978 place871 )
    ( surface-at crate978 place871 )
    ( on crate978 pallet978 )
    ( is-crate crate978 )
    ( clear crate978 )
    ( surface-at pallet776 place724 )
    ( surface-at crate776 place724 )
    ( on crate776 pallet776 )
    ( is-crate crate776 )
    ( clear crate776 )
    ( surface-at pallet109 place871 )
    ( surface-at crate109 place871 )
    ( on crate109 pallet109 )
    ( is-crate crate109 )
    ( clear crate109 )
  )
  ( :tasks
    ( Make-3Crate pallet0 crate978 crate776 crate109 )
  )
)
