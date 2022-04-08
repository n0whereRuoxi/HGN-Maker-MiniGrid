( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    place962 - place
    hoist962 - hoist
    place690 - place
    hoist690 - hoist
    place0 - place
    hoist0 - hoist
    crate654 - surface
    pallet654 - surface
    crate136 - surface
    pallet136 - surface
    crate991 - surface
    pallet991 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist962 place962 )
    ( available hoist962 )
    ( hoist-at hoist690 place690 )
    ( available hoist690 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet654 place962 )
    ( surface-at crate654 place962 )
    ( on crate654 pallet654 )
    ( is-crate crate654 )
    ( clear crate654 )
    ( surface-at pallet136 place962 )
    ( surface-at crate136 place962 )
    ( on crate136 pallet136 )
    ( is-crate crate136 )
    ( clear crate136 )
    ( surface-at pallet991 place690 )
    ( surface-at crate991 place690 )
    ( on crate991 pallet991 )
    ( is-crate crate991 )
    ( clear crate991 )
  )
  ( :tasks
    ( Make-3Crate crate654 crate136 crate991 l000 )
  )
)
