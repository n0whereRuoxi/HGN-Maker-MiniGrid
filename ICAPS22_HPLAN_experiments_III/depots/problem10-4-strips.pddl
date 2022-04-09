( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place152 - place
    hoist152 - hoist
    place951 - place
    hoist951 - hoist
    place155 - place
    hoist155 - hoist
    place174 - place
    hoist174 - hoist
    place747 - place
    hoist747 - hoist
    place167 - place
    hoist167 - hoist
    place238 - place
    hoist238 - hoist
    place390 - place
    hoist390 - hoist
    place180 - place
    hoist180 - hoist
    place216 - place
    hoist216 - hoist
    place0 - place
    hoist0 - hoist
    crate91 - surface
    pallet91 - surface
    crate577 - surface
    pallet577 - surface
    crate675 - surface
    pallet675 - surface
    crate803 - surface
    pallet803 - surface
    crate44 - surface
    pallet44 - surface
    crate120 - surface
    pallet120 - surface
    crate293 - surface
    pallet293 - surface
    crate583 - surface
    pallet583 - surface
    crate47 - surface
    pallet47 - surface
    crate314 - surface
    pallet314 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist152 place152 )
    ( available hoist152 )
    ( hoist-at hoist951 place951 )
    ( available hoist951 )
    ( hoist-at hoist155 place155 )
    ( available hoist155 )
    ( hoist-at hoist174 place174 )
    ( available hoist174 )
    ( hoist-at hoist747 place747 )
    ( available hoist747 )
    ( hoist-at hoist167 place167 )
    ( available hoist167 )
    ( hoist-at hoist238 place238 )
    ( available hoist238 )
    ( hoist-at hoist390 place390 )
    ( available hoist390 )
    ( hoist-at hoist180 place180 )
    ( available hoist180 )
    ( hoist-at hoist216 place216 )
    ( available hoist216 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet91 place174 )
    ( surface-at crate91 place174 )
    ( on crate91 pallet91 )
    ( is-crate crate91 )
    ( clear crate91 )
    ( surface-at pallet577 place174 )
    ( surface-at crate577 place174 )
    ( on crate577 pallet577 )
    ( is-crate crate577 )
    ( clear crate577 )
    ( surface-at pallet675 place152 )
    ( surface-at crate675 place152 )
    ( on crate675 pallet675 )
    ( is-crate crate675 )
    ( clear crate675 )
    ( surface-at pallet803 place747 )
    ( surface-at crate803 place747 )
    ( on crate803 pallet803 )
    ( is-crate crate803 )
    ( clear crate803 )
    ( surface-at pallet44 place152 )
    ( surface-at crate44 place152 )
    ( on crate44 pallet44 )
    ( is-crate crate44 )
    ( clear crate44 )
    ( surface-at pallet120 place174 )
    ( surface-at crate120 place174 )
    ( on crate120 pallet120 )
    ( is-crate crate120 )
    ( clear crate120 )
    ( surface-at pallet293 place216 )
    ( surface-at crate293 place216 )
    ( on crate293 pallet293 )
    ( is-crate crate293 )
    ( clear crate293 )
    ( surface-at pallet583 place155 )
    ( surface-at crate583 place155 )
    ( on crate583 pallet583 )
    ( is-crate crate583 )
    ( clear crate583 )
    ( surface-at pallet47 place390 )
    ( surface-at crate47 place390 )
    ( on crate47 pallet47 )
    ( is-crate crate47 )
    ( clear crate47 )
    ( surface-at pallet314 place180 )
    ( surface-at crate314 place180 )
    ( on crate314 pallet314 )
    ( is-crate crate314 )
    ( clear crate314 )
  )
  ( :goal
    ( and
    )
  )
)
