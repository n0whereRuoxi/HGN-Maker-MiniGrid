( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place340 - place
    hoist340 - hoist
    place323 - place
    hoist323 - hoist
    place218 - place
    hoist218 - hoist
    place930 - place
    hoist930 - hoist
    place23 - place
    hoist23 - hoist
    place424 - place
    hoist424 - hoist
    place39 - place
    hoist39 - hoist
    place0 - place
    hoist0 - hoist
    crate795 - surface
    pallet795 - surface
    crate758 - surface
    pallet758 - surface
    crate316 - surface
    pallet316 - surface
    crate962 - surface
    pallet962 - surface
    crate926 - surface
    pallet926 - surface
    crate836 - surface
    pallet836 - surface
    crate542 - surface
    pallet542 - surface
    crate183 - surface
    pallet183 - surface
    crate819 - surface
    pallet819 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist340 place340 )
    ( available hoist340 )
    ( hoist-at hoist323 place323 )
    ( available hoist323 )
    ( hoist-at hoist218 place218 )
    ( available hoist218 )
    ( hoist-at hoist930 place930 )
    ( available hoist930 )
    ( hoist-at hoist23 place23 )
    ( available hoist23 )
    ( hoist-at hoist424 place424 )
    ( available hoist424 )
    ( hoist-at hoist39 place39 )
    ( available hoist39 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet795 place218 )
    ( surface-at crate795 place218 )
    ( on crate795 pallet795 )
    ( is-crate crate795 )
    ( clear crate795 )
    ( surface-at pallet758 place323 )
    ( surface-at crate758 place323 )
    ( on crate758 pallet758 )
    ( is-crate crate758 )
    ( clear crate758 )
    ( surface-at pallet316 place39 )
    ( surface-at crate316 place39 )
    ( on crate316 pallet316 )
    ( is-crate crate316 )
    ( clear crate316 )
    ( surface-at pallet962 place930 )
    ( surface-at crate962 place930 )
    ( on crate962 pallet962 )
    ( is-crate crate962 )
    ( clear crate962 )
    ( surface-at pallet926 place23 )
    ( surface-at crate926 place23 )
    ( on crate926 pallet926 )
    ( is-crate crate926 )
    ( clear crate926 )
    ( surface-at pallet836 place23 )
    ( surface-at crate836 place23 )
    ( on crate836 pallet836 )
    ( is-crate crate836 )
    ( clear crate836 )
    ( surface-at pallet542 place340 )
    ( surface-at crate542 place340 )
    ( on crate542 pallet542 )
    ( is-crate crate542 )
    ( clear crate542 )
    ( surface-at pallet183 place23 )
    ( surface-at crate183 place23 )
    ( on crate183 pallet183 )
    ( is-crate crate183 )
    ( clear crate183 )
    ( surface-at pallet819 place23 )
    ( surface-at crate819 place23 )
    ( on crate819 pallet819 )
    ( is-crate crate819 )
    ( clear crate819 )
  )
  ( :tasks
    ( Make-9Crate crate795 crate758 crate316 crate962 crate926 crate836 crate542 crate183 crate819 l000 )
  )
)
