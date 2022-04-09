( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place985 - place
    hoist985 - hoist
    place29 - place
    hoist29 - hoist
    place181 - place
    hoist181 - hoist
    place303 - place
    hoist303 - hoist
    place762 - place
    hoist762 - hoist
    place357 - place
    hoist357 - hoist
    place414 - place
    hoist414 - hoist
    place75 - place
    hoist75 - hoist
    place878 - place
    hoist878 - hoist
    place306 - place
    hoist306 - hoist
    place364 - place
    hoist364 - hoist
    place24 - place
    hoist24 - hoist
    place481 - place
    hoist481 - hoist
    place286 - place
    hoist286 - hoist
    place0 - place
    hoist0 - hoist
    crate383 - surface
    pallet383 - surface
    crate190 - surface
    pallet190 - surface
    crate668 - surface
    pallet668 - surface
    crate337 - surface
    pallet337 - surface
    crate980 - surface
    pallet980 - surface
    crate167 - surface
    pallet167 - surface
    crate205 - surface
    pallet205 - surface
    crate620 - surface
    pallet620 - surface
    crate127 - surface
    pallet127 - surface
    crate633 - surface
    pallet633 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist985 place985 )
    ( available hoist985 )
    ( hoist-at hoist29 place29 )
    ( available hoist29 )
    ( hoist-at hoist181 place181 )
    ( available hoist181 )
    ( hoist-at hoist303 place303 )
    ( available hoist303 )
    ( hoist-at hoist762 place762 )
    ( available hoist762 )
    ( hoist-at hoist357 place357 )
    ( available hoist357 )
    ( hoist-at hoist414 place414 )
    ( available hoist414 )
    ( hoist-at hoist75 place75 )
    ( available hoist75 )
    ( hoist-at hoist878 place878 )
    ( available hoist878 )
    ( hoist-at hoist306 place306 )
    ( available hoist306 )
    ( hoist-at hoist364 place364 )
    ( available hoist364 )
    ( hoist-at hoist24 place24 )
    ( available hoist24 )
    ( hoist-at hoist481 place481 )
    ( available hoist481 )
    ( hoist-at hoist286 place286 )
    ( available hoist286 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet383 place29 )
    ( surface-at crate383 place29 )
    ( on crate383 pallet383 )
    ( is-crate crate383 )
    ( clear crate383 )
    ( surface-at pallet190 place24 )
    ( surface-at crate190 place24 )
    ( on crate190 pallet190 )
    ( is-crate crate190 )
    ( clear crate190 )
    ( surface-at pallet668 place985 )
    ( surface-at crate668 place985 )
    ( on crate668 pallet668 )
    ( is-crate crate668 )
    ( clear crate668 )
    ( surface-at pallet337 place181 )
    ( surface-at crate337 place181 )
    ( on crate337 pallet337 )
    ( is-crate crate337 )
    ( clear crate337 )
    ( surface-at pallet980 place357 )
    ( surface-at crate980 place357 )
    ( on crate980 pallet980 )
    ( is-crate crate980 )
    ( clear crate980 )
    ( surface-at pallet167 place75 )
    ( surface-at crate167 place75 )
    ( on crate167 pallet167 )
    ( is-crate crate167 )
    ( clear crate167 )
    ( surface-at pallet205 place762 )
    ( surface-at crate205 place762 )
    ( on crate205 pallet205 )
    ( is-crate crate205 )
    ( clear crate205 )
    ( surface-at pallet620 place878 )
    ( surface-at crate620 place878 )
    ( on crate620 pallet620 )
    ( is-crate crate620 )
    ( clear crate620 )
    ( surface-at pallet127 place306 )
    ( surface-at crate127 place306 )
    ( on crate127 pallet127 )
    ( is-crate crate127 )
    ( clear crate127 )
    ( surface-at pallet633 place306 )
    ( surface-at crate633 place306 )
    ( on crate633 pallet633 )
    ( is-crate crate633 )
    ( clear crate633 )
  )
  ( :goal
    ( and
    )
  )
)
