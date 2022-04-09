( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place404 - place
    hoist404 - hoist
    place456 - place
    hoist456 - hoist
    place906 - place
    hoist906 - hoist
    place383 - place
    hoist383 - hoist
    place0 - place
    hoist0 - hoist
    crate161 - surface
    pallet161 - surface
    crate398 - surface
    pallet398 - surface
    crate609 - surface
    pallet609 - surface
    crate725 - surface
    pallet725 - surface
    crate369 - surface
    pallet369 - surface
    crate800 - surface
    pallet800 - surface
    crate249 - surface
    pallet249 - surface
    crate69 - surface
    pallet69 - surface
    crate937 - surface
    pallet937 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist404 place404 )
    ( available hoist404 )
    ( hoist-at hoist456 place456 )
    ( available hoist456 )
    ( hoist-at hoist906 place906 )
    ( available hoist906 )
    ( hoist-at hoist383 place383 )
    ( available hoist383 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet161 place906 )
    ( surface-at crate161 place906 )
    ( on crate161 pallet161 )
    ( is-crate crate161 )
    ( clear crate161 )
    ( surface-at pallet398 place906 )
    ( surface-at crate398 place906 )
    ( on crate398 pallet398 )
    ( is-crate crate398 )
    ( clear crate398 )
    ( surface-at pallet609 place456 )
    ( surface-at crate609 place456 )
    ( on crate609 pallet609 )
    ( is-crate crate609 )
    ( clear crate609 )
    ( surface-at pallet725 place906 )
    ( surface-at crate725 place906 )
    ( on crate725 pallet725 )
    ( is-crate crate725 )
    ( clear crate725 )
    ( surface-at pallet369 place383 )
    ( surface-at crate369 place383 )
    ( on crate369 pallet369 )
    ( is-crate crate369 )
    ( clear crate369 )
    ( surface-at pallet800 place906 )
    ( surface-at crate800 place906 )
    ( on crate800 pallet800 )
    ( is-crate crate800 )
    ( clear crate800 )
    ( surface-at pallet249 place383 )
    ( surface-at crate249 place383 )
    ( on crate249 pallet249 )
    ( is-crate crate249 )
    ( clear crate249 )
    ( surface-at pallet69 place906 )
    ( surface-at crate69 place906 )
    ( on crate69 pallet69 )
    ( is-crate crate69 )
    ( clear crate69 )
    ( surface-at pallet937 place383 )
    ( surface-at crate937 place383 )
    ( on crate937 pallet937 )
    ( is-crate crate937 )
    ( clear crate937 )
  )
  ( :goal
    ( and
    )
  )
)
