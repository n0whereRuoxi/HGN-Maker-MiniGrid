( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place723 - place
    hoist723 - hoist
    place17 - place
    hoist17 - hoist
    place352 - place
    hoist352 - hoist
    place434 - place
    hoist434 - hoist
    place591 - place
    hoist591 - hoist
    place414 - place
    hoist414 - hoist
    place265 - place
    hoist265 - hoist
    place786 - place
    hoist786 - hoist
    place801 - place
    hoist801 - hoist
    place615 - place
    hoist615 - hoist
    place317 - place
    hoist317 - hoist
    place881 - place
    hoist881 - hoist
    place0 - place
    hoist0 - hoist
    crate244 - surface
    pallet244 - surface
    crate775 - surface
    pallet775 - surface
    crate849 - surface
    pallet849 - surface
    crate666 - surface
    pallet666 - surface
    crate371 - surface
    pallet371 - surface
    crate473 - surface
    pallet473 - surface
    crate239 - surface
    pallet239 - surface
    crate549 - surface
    pallet549 - surface
    crate361 - surface
    pallet361 - surface
    crate335 - surface
    pallet335 - surface
    crate360 - surface
    pallet360 - surface
    crate808 - surface
    pallet808 - surface
    crate206 - surface
    pallet206 - surface
    crate313 - surface
    pallet313 - surface
    crate12 - surface
    pallet12 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist723 place723 )
    ( available hoist723 )
    ( hoist-at hoist17 place17 )
    ( available hoist17 )
    ( hoist-at hoist352 place352 )
    ( available hoist352 )
    ( hoist-at hoist434 place434 )
    ( available hoist434 )
    ( hoist-at hoist591 place591 )
    ( available hoist591 )
    ( hoist-at hoist414 place414 )
    ( available hoist414 )
    ( hoist-at hoist265 place265 )
    ( available hoist265 )
    ( hoist-at hoist786 place786 )
    ( available hoist786 )
    ( hoist-at hoist801 place801 )
    ( available hoist801 )
    ( hoist-at hoist615 place615 )
    ( available hoist615 )
    ( hoist-at hoist317 place317 )
    ( available hoist317 )
    ( hoist-at hoist881 place881 )
    ( available hoist881 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet244 place723 )
    ( surface-at crate244 place723 )
    ( on crate244 pallet244 )
    ( is-crate crate244 )
    ( clear crate244 )
    ( surface-at pallet775 place591 )
    ( surface-at crate775 place591 )
    ( on crate775 pallet775 )
    ( is-crate crate775 )
    ( clear crate775 )
    ( surface-at pallet849 place414 )
    ( surface-at crate849 place414 )
    ( on crate849 pallet849 )
    ( is-crate crate849 )
    ( clear crate849 )
    ( surface-at pallet666 place265 )
    ( surface-at crate666 place265 )
    ( on crate666 pallet666 )
    ( is-crate crate666 )
    ( clear crate666 )
    ( surface-at pallet371 place801 )
    ( surface-at crate371 place801 )
    ( on crate371 pallet371 )
    ( is-crate crate371 )
    ( clear crate371 )
    ( surface-at pallet473 place801 )
    ( surface-at crate473 place801 )
    ( on crate473 pallet473 )
    ( is-crate crate473 )
    ( clear crate473 )
    ( surface-at pallet239 place591 )
    ( surface-at crate239 place591 )
    ( on crate239 pallet239 )
    ( is-crate crate239 )
    ( clear crate239 )
    ( surface-at pallet549 place591 )
    ( surface-at crate549 place591 )
    ( on crate549 pallet549 )
    ( is-crate crate549 )
    ( clear crate549 )
    ( surface-at pallet361 place881 )
    ( surface-at crate361 place881 )
    ( on crate361 pallet361 )
    ( is-crate crate361 )
    ( clear crate361 )
    ( surface-at pallet335 place352 )
    ( surface-at crate335 place352 )
    ( on crate335 pallet335 )
    ( is-crate crate335 )
    ( clear crate335 )
    ( surface-at pallet360 place723 )
    ( surface-at crate360 place723 )
    ( on crate360 pallet360 )
    ( is-crate crate360 )
    ( clear crate360 )
    ( surface-at pallet808 place352 )
    ( surface-at crate808 place352 )
    ( on crate808 pallet808 )
    ( is-crate crate808 )
    ( clear crate808 )
    ( surface-at pallet206 place265 )
    ( surface-at crate206 place265 )
    ( on crate206 pallet206 )
    ( is-crate crate206 )
    ( clear crate206 )
    ( surface-at pallet313 place414 )
    ( surface-at crate313 place414 )
    ( on crate313 pallet313 )
    ( is-crate crate313 )
    ( clear crate313 )
    ( surface-at pallet12 place434 )
    ( surface-at crate12 place434 )
    ( on crate12 pallet12 )
    ( is-crate crate12 )
    ( clear crate12 )
  )
  ( :tasks
    ( Make-15Crate pallet0 crate244 crate775 crate849 crate666 crate371 crate473 crate239 crate549 crate361 crate335 crate360 crate808 crate206 crate313 crate12 )
  )
)
