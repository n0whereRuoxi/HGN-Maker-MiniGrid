( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place736 - place
    hoist736 - hoist
    place33 - place
    hoist33 - hoist
    place0 - place
    hoist0 - hoist
    crate811 - surface
    pallet811 - surface
    crate158 - surface
    pallet158 - surface
    crate673 - surface
    pallet673 - surface
    crate706 - surface
    pallet706 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist736 place736 )
    ( available hoist736 )
    ( hoist-at hoist33 place33 )
    ( available hoist33 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet811 place736 )
    ( surface-at crate811 place736 )
    ( on crate811 pallet811 )
    ( is-crate crate811 )
    ( clear crate811 )
    ( surface-at pallet158 place736 )
    ( surface-at crate158 place736 )
    ( on crate158 pallet158 )
    ( is-crate crate158 )
    ( clear crate158 )
    ( surface-at pallet673 place33 )
    ( surface-at crate673 place33 )
    ( on crate673 pallet673 )
    ( is-crate crate673 )
    ( clear crate673 )
    ( surface-at pallet706 place33 )
    ( surface-at crate706 place33 )
    ( on crate706 pallet706 )
    ( is-crate crate706 )
    ( clear crate706 )
  )
  ( :tasks
    ( Make-4Crate crate811 crate158 crate673 crate706 l000 )
  )
)
