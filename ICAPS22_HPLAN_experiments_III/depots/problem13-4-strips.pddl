( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place496 - place
    hoist496 - hoist
    place622 - place
    hoist622 - hoist
    place524 - place
    hoist524 - hoist
    place494 - place
    hoist494 - hoist
    place907 - place
    hoist907 - hoist
    place351 - place
    hoist351 - hoist
    place529 - place
    hoist529 - hoist
    place861 - place
    hoist861 - hoist
    place36 - place
    hoist36 - hoist
    place528 - place
    hoist528 - hoist
    place680 - place
    hoist680 - hoist
    place0 - place
    hoist0 - hoist
    crate977 - surface
    pallet977 - surface
    crate295 - surface
    pallet295 - surface
    crate744 - surface
    pallet744 - surface
    crate686 - surface
    pallet686 - surface
    crate250 - surface
    pallet250 - surface
    crate47 - surface
    pallet47 - surface
    crate598 - surface
    pallet598 - surface
    crate779 - surface
    pallet779 - surface
    crate685 - surface
    pallet685 - surface
    crate424 - surface
    pallet424 - surface
    crate797 - surface
    pallet797 - surface
    crate408 - surface
    pallet408 - surface
    crate965 - surface
    pallet965 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist496 place496 )
    ( available hoist496 )
    ( hoist-at hoist622 place622 )
    ( available hoist622 )
    ( hoist-at hoist524 place524 )
    ( available hoist524 )
    ( hoist-at hoist494 place494 )
    ( available hoist494 )
    ( hoist-at hoist907 place907 )
    ( available hoist907 )
    ( hoist-at hoist351 place351 )
    ( available hoist351 )
    ( hoist-at hoist529 place529 )
    ( available hoist529 )
    ( hoist-at hoist861 place861 )
    ( available hoist861 )
    ( hoist-at hoist36 place36 )
    ( available hoist36 )
    ( hoist-at hoist528 place528 )
    ( available hoist528 )
    ( hoist-at hoist680 place680 )
    ( available hoist680 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet977 place494 )
    ( surface-at crate977 place494 )
    ( on crate977 pallet977 )
    ( is-crate crate977 )
    ( clear crate977 )
    ( surface-at pallet295 place680 )
    ( surface-at crate295 place680 )
    ( on crate295 pallet295 )
    ( is-crate crate295 )
    ( clear crate295 )
    ( surface-at pallet744 place529 )
    ( surface-at crate744 place529 )
    ( on crate744 pallet744 )
    ( is-crate crate744 )
    ( clear crate744 )
    ( surface-at pallet686 place494 )
    ( surface-at crate686 place494 )
    ( on crate686 pallet686 )
    ( is-crate crate686 )
    ( clear crate686 )
    ( surface-at pallet250 place529 )
    ( surface-at crate250 place529 )
    ( on crate250 pallet250 )
    ( is-crate crate250 )
    ( clear crate250 )
    ( surface-at pallet47 place861 )
    ( surface-at crate47 place861 )
    ( on crate47 pallet47 )
    ( is-crate crate47 )
    ( clear crate47 )
    ( surface-at pallet598 place36 )
    ( surface-at crate598 place36 )
    ( on crate598 pallet598 )
    ( is-crate crate598 )
    ( clear crate598 )
    ( surface-at pallet779 place529 )
    ( surface-at crate779 place529 )
    ( on crate779 pallet779 )
    ( is-crate crate779 )
    ( clear crate779 )
    ( surface-at pallet685 place494 )
    ( surface-at crate685 place494 )
    ( on crate685 pallet685 )
    ( is-crate crate685 )
    ( clear crate685 )
    ( surface-at pallet424 place861 )
    ( surface-at crate424 place861 )
    ( on crate424 pallet424 )
    ( is-crate crate424 )
    ( clear crate424 )
    ( surface-at pallet797 place351 )
    ( surface-at crate797 place351 )
    ( on crate797 pallet797 )
    ( is-crate crate797 )
    ( clear crate797 )
    ( surface-at pallet408 place494 )
    ( surface-at crate408 place494 )
    ( on crate408 pallet408 )
    ( is-crate crate408 )
    ( clear crate408 )
    ( surface-at pallet965 place680 )
    ( surface-at crate965 place680 )
    ( on crate965 pallet965 )
    ( is-crate crate965 )
    ( clear crate965 )
  )
  ( :goal
    ( and
    )
  )
)
