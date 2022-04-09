( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place951 - place
    hoist951 - hoist
    place922 - place
    hoist922 - hoist
    place522 - place
    hoist522 - hoist
    place63 - place
    hoist63 - hoist
    place0 - place
    hoist0 - hoist
    crate548 - surface
    pallet548 - surface
    crate933 - surface
    pallet933 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist951 place951 )
    ( available hoist951 )
    ( hoist-at hoist922 place922 )
    ( available hoist922 )
    ( hoist-at hoist522 place522 )
    ( available hoist522 )
    ( hoist-at hoist63 place63 )
    ( available hoist63 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet548 place922 )
    ( surface-at crate548 place922 )
    ( on crate548 pallet548 )
    ( is-crate crate548 )
    ( clear crate548 )
    ( surface-at pallet933 place922 )
    ( surface-at crate933 place922 )
    ( on crate933 pallet933 )
    ( is-crate crate933 )
    ( clear crate933 )
  )
  ( :tasks
    ( Make-2Crate pallet0 crate548 crate933 )
  )
)
