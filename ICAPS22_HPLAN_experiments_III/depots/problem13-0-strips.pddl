( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place875 - place
    hoist875 - hoist
    place459 - place
    hoist459 - hoist
    place452 - place
    hoist452 - hoist
    place92 - place
    hoist92 - hoist
    place642 - place
    hoist642 - hoist
    place767 - place
    hoist767 - hoist
    place450 - place
    hoist450 - hoist
    place124 - place
    hoist124 - hoist
    place889 - place
    hoist889 - hoist
    place295 - place
    hoist295 - hoist
    place97 - place
    hoist97 - hoist
    place10 - place
    hoist10 - hoist
    place28 - place
    hoist28 - hoist
    place509 - place
    hoist509 - hoist
    place931 - place
    hoist931 - hoist
    place684 - place
    hoist684 - hoist
    place410 - place
    hoist410 - hoist
    place327 - place
    hoist327 - hoist
    place624 - place
    hoist624 - hoist
    place482 - place
    hoist482 - hoist
    place0 - place
    hoist0 - hoist
    crate39 - surface
    pallet39 - surface
    crate770 - surface
    pallet770 - surface
    crate414 - surface
    pallet414 - surface
    crate86 - surface
    pallet86 - surface
    crate64 - surface
    pallet64 - surface
    crate945 - surface
    pallet945 - surface
    crate826 - surface
    pallet826 - surface
    crate500 - surface
    pallet500 - surface
    crate382 - surface
    pallet382 - surface
    crate108 - surface
    pallet108 - surface
    crate754 - surface
    pallet754 - surface
    crate113 - surface
    pallet113 - surface
    crate442 - surface
    pallet442 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist875 place875 )
    ( available hoist875 )
    ( hoist-at hoist459 place459 )
    ( available hoist459 )
    ( hoist-at hoist452 place452 )
    ( available hoist452 )
    ( hoist-at hoist92 place92 )
    ( available hoist92 )
    ( hoist-at hoist642 place642 )
    ( available hoist642 )
    ( hoist-at hoist767 place767 )
    ( available hoist767 )
    ( hoist-at hoist450 place450 )
    ( available hoist450 )
    ( hoist-at hoist124 place124 )
    ( available hoist124 )
    ( hoist-at hoist889 place889 )
    ( available hoist889 )
    ( hoist-at hoist295 place295 )
    ( available hoist295 )
    ( hoist-at hoist97 place97 )
    ( available hoist97 )
    ( hoist-at hoist10 place10 )
    ( available hoist10 )
    ( hoist-at hoist28 place28 )
    ( available hoist28 )
    ( hoist-at hoist509 place509 )
    ( available hoist509 )
    ( hoist-at hoist931 place931 )
    ( available hoist931 )
    ( hoist-at hoist684 place684 )
    ( available hoist684 )
    ( hoist-at hoist410 place410 )
    ( available hoist410 )
    ( hoist-at hoist327 place327 )
    ( available hoist327 )
    ( hoist-at hoist624 place624 )
    ( available hoist624 )
    ( hoist-at hoist482 place482 )
    ( available hoist482 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet39 place482 )
    ( surface-at crate39 place482 )
    ( on crate39 pallet39 )
    ( is-crate crate39 )
    ( clear crate39 )
    ( surface-at pallet770 place327 )
    ( surface-at crate770 place327 )
    ( on crate770 pallet770 )
    ( is-crate crate770 )
    ( clear crate770 )
    ( surface-at pallet414 place452 )
    ( surface-at crate414 place452 )
    ( on crate414 pallet414 )
    ( is-crate crate414 )
    ( clear crate414 )
    ( surface-at pallet86 place767 )
    ( surface-at crate86 place767 )
    ( on crate86 pallet86 )
    ( is-crate crate86 )
    ( clear crate86 )
    ( surface-at pallet64 place684 )
    ( surface-at crate64 place684 )
    ( on crate64 pallet64 )
    ( is-crate crate64 )
    ( clear crate64 )
    ( surface-at pallet945 place410 )
    ( surface-at crate945 place410 )
    ( on crate945 pallet945 )
    ( is-crate crate945 )
    ( clear crate945 )
    ( surface-at pallet826 place452 )
    ( surface-at crate826 place452 )
    ( on crate826 pallet826 )
    ( is-crate crate826 )
    ( clear crate826 )
    ( surface-at pallet500 place931 )
    ( surface-at crate500 place931 )
    ( on crate500 pallet500 )
    ( is-crate crate500 )
    ( clear crate500 )
    ( surface-at pallet382 place931 )
    ( surface-at crate382 place931 )
    ( on crate382 pallet382 )
    ( is-crate crate382 )
    ( clear crate382 )
    ( surface-at pallet108 place642 )
    ( surface-at crate108 place642 )
    ( on crate108 pallet108 )
    ( is-crate crate108 )
    ( clear crate108 )
    ( surface-at pallet754 place450 )
    ( surface-at crate754 place450 )
    ( on crate754 pallet754 )
    ( is-crate crate754 )
    ( clear crate754 )
    ( surface-at pallet113 place931 )
    ( surface-at crate113 place931 )
    ( on crate113 pallet113 )
    ( is-crate crate113 )
    ( clear crate113 )
    ( surface-at pallet442 place889 )
    ( surface-at crate442 place889 )
    ( on crate442 pallet442 )
    ( is-crate crate442 )
    ( clear crate442 )
  )
  ( :goal
    ( and
    )
  )
)
