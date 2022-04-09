( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place971 - place
    hoist971 - hoist
    place338 - place
    hoist338 - hoist
    place121 - place
    hoist121 - hoist
    place396 - place
    hoist396 - hoist
    place585 - place
    hoist585 - hoist
    place635 - place
    hoist635 - hoist
    place45 - place
    hoist45 - hoist
    place594 - place
    hoist594 - hoist
    place0 - place
    hoist0 - hoist
    crate242 - surface
    pallet242 - surface
    crate314 - surface
    pallet314 - surface
    crate730 - surface
    pallet730 - surface
    crate981 - surface
    pallet981 - surface
    crate126 - surface
    pallet126 - surface
    crate324 - surface
    pallet324 - surface
    crate41 - surface
    pallet41 - surface
    crate53 - surface
    pallet53 - surface
    crate570 - surface
    pallet570 - surface
    crate147 - surface
    pallet147 - surface
    crate273 - surface
    pallet273 - surface
    crate823 - surface
    pallet823 - surface
    crate396 - surface
    pallet396 - surface
    crate438 - surface
    pallet438 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist971 place971 )
    ( available hoist971 )
    ( hoist-at hoist338 place338 )
    ( available hoist338 )
    ( hoist-at hoist121 place121 )
    ( available hoist121 )
    ( hoist-at hoist396 place396 )
    ( available hoist396 )
    ( hoist-at hoist585 place585 )
    ( available hoist585 )
    ( hoist-at hoist635 place635 )
    ( available hoist635 )
    ( hoist-at hoist45 place45 )
    ( available hoist45 )
    ( hoist-at hoist594 place594 )
    ( available hoist594 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet242 place396 )
    ( surface-at crate242 place396 )
    ( on crate242 pallet242 )
    ( is-crate crate242 )
    ( clear crate242 )
    ( surface-at pallet314 place45 )
    ( surface-at crate314 place45 )
    ( on crate314 pallet314 )
    ( is-crate crate314 )
    ( clear crate314 )
    ( surface-at pallet730 place585 )
    ( surface-at crate730 place585 )
    ( on crate730 pallet730 )
    ( is-crate crate730 )
    ( clear crate730 )
    ( surface-at pallet981 place594 )
    ( surface-at crate981 place594 )
    ( on crate981 pallet981 )
    ( is-crate crate981 )
    ( clear crate981 )
    ( surface-at pallet126 place396 )
    ( surface-at crate126 place396 )
    ( on crate126 pallet126 )
    ( is-crate crate126 )
    ( clear crate126 )
    ( surface-at pallet324 place45 )
    ( surface-at crate324 place45 )
    ( on crate324 pallet324 )
    ( is-crate crate324 )
    ( clear crate324 )
    ( surface-at pallet41 place594 )
    ( surface-at crate41 place594 )
    ( on crate41 pallet41 )
    ( is-crate crate41 )
    ( clear crate41 )
    ( surface-at pallet53 place635 )
    ( surface-at crate53 place635 )
    ( on crate53 pallet53 )
    ( is-crate crate53 )
    ( clear crate53 )
    ( surface-at pallet570 place121 )
    ( surface-at crate570 place121 )
    ( on crate570 pallet570 )
    ( is-crate crate570 )
    ( clear crate570 )
    ( surface-at pallet147 place585 )
    ( surface-at crate147 place585 )
    ( on crate147 pallet147 )
    ( is-crate crate147 )
    ( clear crate147 )
    ( surface-at pallet273 place635 )
    ( surface-at crate273 place635 )
    ( on crate273 pallet273 )
    ( is-crate crate273 )
    ( clear crate273 )
    ( surface-at pallet823 place594 )
    ( surface-at crate823 place594 )
    ( on crate823 pallet823 )
    ( is-crate crate823 )
    ( clear crate823 )
    ( surface-at pallet396 place594 )
    ( surface-at crate396 place594 )
    ( on crate396 pallet396 )
    ( is-crate crate396 )
    ( clear crate396 )
    ( surface-at pallet438 place121 )
    ( surface-at crate438 place121 )
    ( on crate438 pallet438 )
    ( is-crate crate438 )
    ( clear crate438 )
  )
  ( :tasks
    ( Make-14Crate pallet0 crate242 crate314 crate730 crate981 crate126 crate324 crate41 crate53 crate570 crate147 crate273 crate823 crate396 crate438 )
  )
)
