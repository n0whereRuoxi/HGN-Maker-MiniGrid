( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    place160 - place
    pallet160 - surface
    hoist160 - hoist
    place797 - place
    pallet797 - surface
    hoist797 - hoist
    place349 - place
    pallet349 - surface
    hoist349 - hoist
    place349 - place
    pallet349 - surface
    hoist349 - hoist
    place823 - place
    pallet823 - surface
    hoist823 - hoist
    place0 - place
    pallet0 - surface
    hoist0 - hoist
    crate851 - surface
    crate266 - surface
    crate697 - surface
    crate233 - surface
    crate98 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist160 place160 )
    ( available hoist160 )
    ( surface-at pallet160 place160 )
    ( hoist-at hoist797 place797 )
    ( available hoist797 )
    ( surface-at pallet797 place797 )
    ( hoist-at hoist349 place349 )
    ( available hoist349 )
    ( surface-at pallet349 place349 )
    ( hoist-at hoist349 place349 )
    ( available hoist349 )
    ( surface-at pallet349 place349 )
    ( hoist-at hoist823 place823 )
    ( available hoist823 )
    ( surface-at pallet823 place823 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet0 place0 )
    ( surface-at crate851 place160 )
    ( on crate851 pallet160 )
    ( is-crate crate851 )
    ( clear crate851 )
    ( surface-at crate266 place797 )
    ( on crate266 pallet797 )
    ( is-crate crate266 )
    ( clear crate266 )
    ( surface-at crate697 place349 )
    ( on crate697 pallet349 )
    ( is-crate crate697 )
    ( clear crate697 )
    ( surface-at crate233 place349 )
    ( on crate233 pallet349 )
    ( is-crate crate233 )
    ( clear crate233 )
    ( surface-at crate98 place823 )
    ( on crate98 pallet823 )
    ( is-crate crate98 )
    ( clear crate98 )
  )
  ( :tasks
    ( Make-5Crate crate851 crate266 crate697 crate233 crate98 l000 )
  )
)
