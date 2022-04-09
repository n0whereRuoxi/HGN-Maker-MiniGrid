( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place951 - place
    hoist951 - hoist
    place750 - place
    hoist750 - hoist
    place292 - place
    hoist292 - hoist
    place447 - place
    hoist447 - hoist
    place12 - place
    hoist12 - hoist
    place67 - place
    hoist67 - hoist
    place136 - place
    hoist136 - hoist
    place0 - place
    hoist0 - hoist
    crate417 - surface
    pallet417 - surface
    crate889 - surface
    pallet889 - surface
    crate971 - surface
    pallet971 - surface
    crate64 - surface
    pallet64 - surface
    crate378 - surface
    pallet378 - surface
    crate326 - surface
    pallet326 - surface
    crate293 - surface
    pallet293 - surface
    crate16 - surface
    pallet16 - surface
    crate237 - surface
    pallet237 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist951 place951 )
    ( available hoist951 )
    ( hoist-at hoist750 place750 )
    ( available hoist750 )
    ( hoist-at hoist292 place292 )
    ( available hoist292 )
    ( hoist-at hoist447 place447 )
    ( available hoist447 )
    ( hoist-at hoist12 place12 )
    ( available hoist12 )
    ( hoist-at hoist67 place67 )
    ( available hoist67 )
    ( hoist-at hoist136 place136 )
    ( available hoist136 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet417 place447 )
    ( surface-at crate417 place447 )
    ( on crate417 pallet417 )
    ( is-crate crate417 )
    ( clear crate417 )
    ( surface-at pallet889 place136 )
    ( surface-at crate889 place136 )
    ( on crate889 pallet889 )
    ( is-crate crate889 )
    ( clear crate889 )
    ( surface-at pallet971 place292 )
    ( surface-at crate971 place292 )
    ( on crate971 pallet971 )
    ( is-crate crate971 )
    ( clear crate971 )
    ( surface-at pallet64 place67 )
    ( surface-at crate64 place67 )
    ( on crate64 pallet64 )
    ( is-crate crate64 )
    ( clear crate64 )
    ( surface-at pallet378 place67 )
    ( surface-at crate378 place67 )
    ( on crate378 pallet378 )
    ( is-crate crate378 )
    ( clear crate378 )
    ( surface-at pallet326 place447 )
    ( surface-at crate326 place447 )
    ( on crate326 pallet326 )
    ( is-crate crate326 )
    ( clear crate326 )
    ( surface-at pallet293 place447 )
    ( surface-at crate293 place447 )
    ( on crate293 pallet293 )
    ( is-crate crate293 )
    ( clear crate293 )
    ( surface-at pallet16 place750 )
    ( surface-at crate16 place750 )
    ( on crate16 pallet16 )
    ( is-crate crate16 )
    ( clear crate16 )
    ( surface-at pallet237 place292 )
    ( surface-at crate237 place292 )
    ( on crate237 pallet237 )
    ( is-crate crate237 )
    ( clear crate237 )
  )
  ( :goal
    ( and
    )
  )
)
