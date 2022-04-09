( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place251 - place
    hoist251 - hoist
    place462 - place
    hoist462 - hoist
    place878 - place
    hoist878 - hoist
    place122 - place
    hoist122 - hoist
    place587 - place
    hoist587 - hoist
    place78 - place
    hoist78 - hoist
    place659 - place
    hoist659 - hoist
    place811 - place
    hoist811 - hoist
    place692 - place
    hoist692 - hoist
    place961 - place
    hoist961 - hoist
    place556 - place
    hoist556 - hoist
    place85 - place
    hoist85 - hoist
    place44 - place
    hoist44 - hoist
    place304 - place
    hoist304 - hoist
    place252 - place
    hoist252 - hoist
    place55 - place
    hoist55 - hoist
    place87 - place
    hoist87 - hoist
    place127 - place
    hoist127 - hoist
    place306 - place
    hoist306 - hoist
    place0 - place
    hoist0 - hoist
    crate998 - surface
    pallet998 - surface
    crate24 - surface
    pallet24 - surface
    crate72 - surface
    pallet72 - surface
    crate809 - surface
    pallet809 - surface
    crate562 - surface
    pallet562 - surface
    crate290 - surface
    pallet290 - surface
    crate308 - surface
    pallet308 - surface
    crate590 - surface
    pallet590 - surface
    crate546 - surface
    pallet546 - surface
    crate834 - surface
    pallet834 - surface
    crate872 - surface
    pallet872 - surface
    crate515 - surface
    pallet515 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist251 place251 )
    ( available hoist251 )
    ( hoist-at hoist462 place462 )
    ( available hoist462 )
    ( hoist-at hoist878 place878 )
    ( available hoist878 )
    ( hoist-at hoist122 place122 )
    ( available hoist122 )
    ( hoist-at hoist587 place587 )
    ( available hoist587 )
    ( hoist-at hoist78 place78 )
    ( available hoist78 )
    ( hoist-at hoist659 place659 )
    ( available hoist659 )
    ( hoist-at hoist811 place811 )
    ( available hoist811 )
    ( hoist-at hoist692 place692 )
    ( available hoist692 )
    ( hoist-at hoist961 place961 )
    ( available hoist961 )
    ( hoist-at hoist556 place556 )
    ( available hoist556 )
    ( hoist-at hoist85 place85 )
    ( available hoist85 )
    ( hoist-at hoist44 place44 )
    ( available hoist44 )
    ( hoist-at hoist304 place304 )
    ( available hoist304 )
    ( hoist-at hoist252 place252 )
    ( available hoist252 )
    ( hoist-at hoist55 place55 )
    ( available hoist55 )
    ( hoist-at hoist87 place87 )
    ( available hoist87 )
    ( hoist-at hoist127 place127 )
    ( available hoist127 )
    ( hoist-at hoist306 place306 )
    ( available hoist306 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet998 place692 )
    ( surface-at crate998 place692 )
    ( on crate998 pallet998 )
    ( is-crate crate998 )
    ( clear crate998 )
    ( surface-at pallet24 place127 )
    ( surface-at crate24 place127 )
    ( on crate24 pallet24 )
    ( is-crate crate24 )
    ( clear crate24 )
    ( surface-at pallet72 place85 )
    ( surface-at crate72 place85 )
    ( on crate72 pallet72 )
    ( is-crate crate72 )
    ( clear crate72 )
    ( surface-at pallet809 place252 )
    ( surface-at crate809 place252 )
    ( on crate809 pallet809 )
    ( is-crate crate809 )
    ( clear crate809 )
    ( surface-at pallet562 place78 )
    ( surface-at crate562 place78 )
    ( on crate562 pallet562 )
    ( is-crate crate562 )
    ( clear crate562 )
    ( surface-at pallet290 place251 )
    ( surface-at crate290 place251 )
    ( on crate290 pallet290 )
    ( is-crate crate290 )
    ( clear crate290 )
    ( surface-at pallet308 place87 )
    ( surface-at crate308 place87 )
    ( on crate308 pallet308 )
    ( is-crate crate308 )
    ( clear crate308 )
    ( surface-at pallet590 place127 )
    ( surface-at crate590 place127 )
    ( on crate590 pallet590 )
    ( is-crate crate590 )
    ( clear crate590 )
    ( surface-at pallet546 place587 )
    ( surface-at crate546 place587 )
    ( on crate546 pallet546 )
    ( is-crate crate546 )
    ( clear crate546 )
    ( surface-at pallet834 place78 )
    ( surface-at crate834 place78 )
    ( on crate834 pallet834 )
    ( is-crate crate834 )
    ( clear crate834 )
    ( surface-at pallet872 place252 )
    ( surface-at crate872 place252 )
    ( on crate872 pallet872 )
    ( is-crate crate872 )
    ( clear crate872 )
    ( surface-at pallet515 place87 )
    ( surface-at crate515 place87 )
    ( on crate515 pallet515 )
    ( is-crate crate515 )
    ( clear crate515 )
  )
  ( :tasks
    ( Make-12Crate pallet0 crate998 crate24 crate72 crate809 crate562 crate290 crate308 crate590 crate546 crate834 crate872 crate515 )
  )
)
