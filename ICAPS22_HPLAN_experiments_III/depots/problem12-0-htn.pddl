( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place236 - place
    hoist236 - hoist
    place128 - place
    hoist128 - hoist
    place226 - place
    hoist226 - hoist
    place401 - place
    hoist401 - hoist
    place619 - place
    hoist619 - hoist
    place431 - place
    hoist431 - hoist
    place225 - place
    hoist225 - hoist
    place0 - place
    hoist0 - hoist
    crate639 - surface
    pallet639 - surface
    crate353 - surface
    pallet353 - surface
    crate645 - surface
    pallet645 - surface
    crate824 - surface
    pallet824 - surface
    crate266 - surface
    pallet266 - surface
    crate358 - surface
    pallet358 - surface
    crate558 - surface
    pallet558 - surface
    crate624 - surface
    pallet624 - surface
    crate373 - surface
    pallet373 - surface
    crate711 - surface
    pallet711 - surface
    crate569 - surface
    pallet569 - surface
    crate931 - surface
    pallet931 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist236 place236 )
    ( available hoist236 )
    ( hoist-at hoist128 place128 )
    ( available hoist128 )
    ( hoist-at hoist226 place226 )
    ( available hoist226 )
    ( hoist-at hoist401 place401 )
    ( available hoist401 )
    ( hoist-at hoist619 place619 )
    ( available hoist619 )
    ( hoist-at hoist431 place431 )
    ( available hoist431 )
    ( hoist-at hoist225 place225 )
    ( available hoist225 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet639 place128 )
    ( surface-at crate639 place128 )
    ( on crate639 pallet639 )
    ( is-crate crate639 )
    ( clear crate639 )
    ( surface-at pallet353 place225 )
    ( surface-at crate353 place225 )
    ( on crate353 pallet353 )
    ( is-crate crate353 )
    ( clear crate353 )
    ( surface-at pallet645 place431 )
    ( surface-at crate645 place431 )
    ( on crate645 pallet645 )
    ( is-crate crate645 )
    ( clear crate645 )
    ( surface-at pallet824 place128 )
    ( surface-at crate824 place128 )
    ( on crate824 pallet824 )
    ( is-crate crate824 )
    ( clear crate824 )
    ( surface-at pallet266 place431 )
    ( surface-at crate266 place431 )
    ( on crate266 pallet266 )
    ( is-crate crate266 )
    ( clear crate266 )
    ( surface-at pallet358 place236 )
    ( surface-at crate358 place236 )
    ( on crate358 pallet358 )
    ( is-crate crate358 )
    ( clear crate358 )
    ( surface-at pallet558 place431 )
    ( surface-at crate558 place431 )
    ( on crate558 pallet558 )
    ( is-crate crate558 )
    ( clear crate558 )
    ( surface-at pallet624 place619 )
    ( surface-at crate624 place619 )
    ( on crate624 pallet624 )
    ( is-crate crate624 )
    ( clear crate624 )
    ( surface-at pallet373 place236 )
    ( surface-at crate373 place236 )
    ( on crate373 pallet373 )
    ( is-crate crate373 )
    ( clear crate373 )
    ( surface-at pallet711 place236 )
    ( surface-at crate711 place236 )
    ( on crate711 pallet711 )
    ( is-crate crate711 )
    ( clear crate711 )
    ( surface-at pallet569 place401 )
    ( surface-at crate569 place401 )
    ( on crate569 pallet569 )
    ( is-crate crate569 )
    ( clear crate569 )
    ( surface-at pallet931 place619 )
    ( surface-at crate931 place619 )
    ( on crate931 pallet931 )
    ( is-crate crate931 )
    ( clear crate931 )
  )
  ( :tasks
    ( Make-12Crate pallet0 crate639 crate353 crate645 crate824 crate266 crate358 crate558 crate624 crate373 crate711 crate569 crate931 )
  )
)
