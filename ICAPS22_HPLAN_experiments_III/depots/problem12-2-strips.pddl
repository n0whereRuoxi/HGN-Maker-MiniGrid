( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place550 - place
    hoist550 - hoist
    place543 - place
    hoist543 - hoist
    place399 - place
    hoist399 - hoist
    place83 - place
    hoist83 - hoist
    place390 - place
    hoist390 - hoist
    place773 - place
    hoist773 - hoist
    place220 - place
    hoist220 - hoist
    place480 - place
    hoist480 - hoist
    place233 - place
    hoist233 - hoist
    place524 - place
    hoist524 - hoist
    place967 - place
    hoist967 - hoist
    place119 - place
    hoist119 - hoist
    place275 - place
    hoist275 - hoist
    place982 - place
    hoist982 - hoist
    place559 - place
    hoist559 - hoist
    place51 - place
    hoist51 - hoist
    place240 - place
    hoist240 - hoist
    place337 - place
    hoist337 - hoist
    place0 - place
    hoist0 - hoist
    crate163 - surface
    pallet163 - surface
    crate794 - surface
    pallet794 - surface
    crate809 - surface
    pallet809 - surface
    crate779 - surface
    pallet779 - surface
    crate292 - surface
    pallet292 - surface
    crate220 - surface
    pallet220 - surface
    crate302 - surface
    pallet302 - surface
    crate777 - surface
    pallet777 - surface
    crate396 - surface
    pallet396 - surface
    crate133 - surface
    pallet133 - surface
    crate168 - surface
    pallet168 - surface
    crate755 - surface
    pallet755 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist550 place550 )
    ( available hoist550 )
    ( hoist-at hoist543 place543 )
    ( available hoist543 )
    ( hoist-at hoist399 place399 )
    ( available hoist399 )
    ( hoist-at hoist83 place83 )
    ( available hoist83 )
    ( hoist-at hoist390 place390 )
    ( available hoist390 )
    ( hoist-at hoist773 place773 )
    ( available hoist773 )
    ( hoist-at hoist220 place220 )
    ( available hoist220 )
    ( hoist-at hoist480 place480 )
    ( available hoist480 )
    ( hoist-at hoist233 place233 )
    ( available hoist233 )
    ( hoist-at hoist524 place524 )
    ( available hoist524 )
    ( hoist-at hoist967 place967 )
    ( available hoist967 )
    ( hoist-at hoist119 place119 )
    ( available hoist119 )
    ( hoist-at hoist275 place275 )
    ( available hoist275 )
    ( hoist-at hoist982 place982 )
    ( available hoist982 )
    ( hoist-at hoist559 place559 )
    ( available hoist559 )
    ( hoist-at hoist51 place51 )
    ( available hoist51 )
    ( hoist-at hoist240 place240 )
    ( available hoist240 )
    ( hoist-at hoist337 place337 )
    ( available hoist337 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet163 place480 )
    ( surface-at crate163 place480 )
    ( on crate163 pallet163 )
    ( is-crate crate163 )
    ( clear crate163 )
    ( surface-at pallet794 place399 )
    ( surface-at crate794 place399 )
    ( on crate794 pallet794 )
    ( is-crate crate794 )
    ( clear crate794 )
    ( surface-at pallet809 place543 )
    ( surface-at crate809 place543 )
    ( on crate809 pallet809 )
    ( is-crate crate809 )
    ( clear crate809 )
    ( surface-at pallet779 place51 )
    ( surface-at crate779 place51 )
    ( on crate779 pallet779 )
    ( is-crate crate779 )
    ( clear crate779 )
    ( surface-at pallet292 place399 )
    ( surface-at crate292 place399 )
    ( on crate292 pallet292 )
    ( is-crate crate292 )
    ( clear crate292 )
    ( surface-at pallet220 place524 )
    ( surface-at crate220 place524 )
    ( on crate220 pallet220 )
    ( is-crate crate220 )
    ( clear crate220 )
    ( surface-at pallet302 place480 )
    ( surface-at crate302 place480 )
    ( on crate302 pallet302 )
    ( is-crate crate302 )
    ( clear crate302 )
    ( surface-at pallet777 place390 )
    ( surface-at crate777 place390 )
    ( on crate777 pallet777 )
    ( is-crate crate777 )
    ( clear crate777 )
    ( surface-at pallet396 place240 )
    ( surface-at crate396 place240 )
    ( on crate396 pallet396 )
    ( is-crate crate396 )
    ( clear crate396 )
    ( surface-at pallet133 place550 )
    ( surface-at crate133 place550 )
    ( on crate133 pallet133 )
    ( is-crate crate133 )
    ( clear crate133 )
    ( surface-at pallet168 place480 )
    ( surface-at crate168 place480 )
    ( on crate168 pallet168 )
    ( is-crate crate168 )
    ( clear crate168 )
    ( surface-at pallet755 place240 )
    ( surface-at crate755 place240 )
    ( on crate755 pallet755 )
    ( is-crate crate755 )
    ( clear crate755 )
  )
  ( :goal
    ( and
    )
  )
)
