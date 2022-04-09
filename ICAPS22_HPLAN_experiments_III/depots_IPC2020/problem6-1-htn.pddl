( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place349 - place
    hoist349 - hoist
    place107 - place
    hoist107 - hoist
    place106 - place
    hoist106 - hoist
    place875 - place
    hoist875 - hoist
    place847 - place
    hoist847 - hoist
    place854 - place
    hoist854 - hoist
    place585 - place
    hoist585 - hoist
    place3 - place
    hoist3 - hoist
    place0 - place
    hoist0 - hoist
    crate268 - surface
    pallet268 - surface
    crate978 - surface
    pallet978 - surface
    crate722 - surface
    pallet722 - surface
    crate772 - surface
    pallet772 - surface
    crate152 - surface
    pallet152 - surface
    crate973 - surface
    pallet973 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist349 place349 )
    ( available hoist349 )
    ( hoist-at hoist107 place107 )
    ( available hoist107 )
    ( hoist-at hoist106 place106 )
    ( available hoist106 )
    ( hoist-at hoist875 place875 )
    ( available hoist875 )
    ( hoist-at hoist847 place847 )
    ( available hoist847 )
    ( hoist-at hoist854 place854 )
    ( available hoist854 )
    ( hoist-at hoist585 place585 )
    ( available hoist585 )
    ( hoist-at hoist3 place3 )
    ( available hoist3 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet268 place106 )
    ( surface-at crate268 place106 )
    ( on crate268 pallet268 )
    ( is-crate crate268 )
    ( clear crate268 )
    ( surface-at pallet978 place107 )
    ( surface-at crate978 place107 )
    ( on crate978 pallet978 )
    ( is-crate crate978 )
    ( clear crate978 )
    ( surface-at pallet722 place3 )
    ( surface-at crate722 place3 )
    ( on crate722 pallet722 )
    ( is-crate crate722 )
    ( clear crate722 )
    ( surface-at pallet772 place847 )
    ( surface-at crate772 place847 )
    ( on crate772 pallet772 )
    ( is-crate crate772 )
    ( clear crate772 )
    ( surface-at pallet152 place3 )
    ( surface-at crate152 place3 )
    ( on crate152 pallet152 )
    ( is-crate crate152 )
    ( clear crate152 )
    ( surface-at pallet973 place854 )
    ( surface-at crate973 place854 )
    ( on crate973 pallet973 )
    ( is-crate crate973 )
    ( clear crate973 )
  )
  ( :tasks
    ( Make-6Crate pallet0 crate268 crate978 crate722 crate772 crate152 crate973 )
  )
)
