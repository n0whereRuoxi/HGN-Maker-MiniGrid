( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place195 - place
    hoist195 - hoist
    place339 - place
    hoist339 - hoist
    place0 - place
    hoist0 - hoist
    crate177 - surface
    pallet177 - surface
    crate478 - surface
    pallet478 - surface
    crate931 - surface
    pallet931 - surface
    crate249 - surface
    pallet249 - surface
    crate6 - surface
    pallet6 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist195 place195 )
    ( available hoist195 )
    ( hoist-at hoist339 place339 )
    ( available hoist339 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet177 place195 )
    ( surface-at crate177 place195 )
    ( on crate177 pallet177 )
    ( is-crate crate177 )
    ( clear crate177 )
    ( surface-at pallet478 place195 )
    ( surface-at crate478 place195 )
    ( on crate478 pallet478 )
    ( is-crate crate478 )
    ( clear crate478 )
    ( surface-at pallet931 place195 )
    ( surface-at crate931 place195 )
    ( on crate931 pallet931 )
    ( is-crate crate931 )
    ( clear crate931 )
    ( surface-at pallet249 place339 )
    ( surface-at crate249 place339 )
    ( on crate249 pallet249 )
    ( is-crate crate249 )
    ( clear crate249 )
    ( surface-at pallet6 place195 )
    ( surface-at crate6 place195 )
    ( on crate6 pallet6 )
    ( is-crate crate6 )
    ( clear crate6 )
  )
  ( :tasks
    ( Make-5Crate pallet0 crate177 crate478 crate931 crate249 crate6 )
  )
)
