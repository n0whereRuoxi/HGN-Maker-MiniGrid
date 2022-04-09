( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place538 - place
    hoist538 - hoist
    place696 - place
    hoist696 - hoist
    place672 - place
    hoist672 - hoist
    place39 - place
    hoist39 - hoist
    place289 - place
    hoist289 - hoist
    place884 - place
    hoist884 - hoist
    place578 - place
    hoist578 - hoist
    place731 - place
    hoist731 - hoist
    place248 - place
    hoist248 - hoist
    place89 - place
    hoist89 - hoist
    place789 - place
    hoist789 - hoist
    place601 - place
    hoist601 - hoist
    place504 - place
    hoist504 - hoist
    place0 - place
    hoist0 - hoist
    crate797 - surface
    pallet797 - surface
    crate104 - surface
    pallet104 - surface
    crate654 - surface
    pallet654 - surface
    crate365 - surface
    pallet365 - surface
    crate900 - surface
    pallet900 - surface
    crate719 - surface
    pallet719 - surface
    crate30 - surface
    pallet30 - surface
    crate304 - surface
    pallet304 - surface
    crate586 - surface
    pallet586 - surface
    crate436 - surface
    pallet436 - surface
    crate822 - surface
    pallet822 - surface
    crate872 - surface
    pallet872 - surface
    crate909 - surface
    pallet909 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist538 place538 )
    ( available hoist538 )
    ( hoist-at hoist696 place696 )
    ( available hoist696 )
    ( hoist-at hoist672 place672 )
    ( available hoist672 )
    ( hoist-at hoist39 place39 )
    ( available hoist39 )
    ( hoist-at hoist289 place289 )
    ( available hoist289 )
    ( hoist-at hoist884 place884 )
    ( available hoist884 )
    ( hoist-at hoist578 place578 )
    ( available hoist578 )
    ( hoist-at hoist731 place731 )
    ( available hoist731 )
    ( hoist-at hoist248 place248 )
    ( available hoist248 )
    ( hoist-at hoist89 place89 )
    ( available hoist89 )
    ( hoist-at hoist789 place789 )
    ( available hoist789 )
    ( hoist-at hoist601 place601 )
    ( available hoist601 )
    ( hoist-at hoist504 place504 )
    ( available hoist504 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet797 place601 )
    ( surface-at crate797 place601 )
    ( on crate797 pallet797 )
    ( is-crate crate797 )
    ( clear crate797 )
    ( surface-at pallet104 place884 )
    ( surface-at crate104 place884 )
    ( on crate104 pallet104 )
    ( is-crate crate104 )
    ( clear crate104 )
    ( surface-at pallet654 place696 )
    ( surface-at crate654 place696 )
    ( on crate654 pallet654 )
    ( is-crate crate654 )
    ( clear crate654 )
    ( surface-at pallet365 place538 )
    ( surface-at crate365 place538 )
    ( on crate365 pallet365 )
    ( is-crate crate365 )
    ( clear crate365 )
    ( surface-at pallet900 place601 )
    ( surface-at crate900 place601 )
    ( on crate900 pallet900 )
    ( is-crate crate900 )
    ( clear crate900 )
    ( surface-at pallet719 place248 )
    ( surface-at crate719 place248 )
    ( on crate719 pallet719 )
    ( is-crate crate719 )
    ( clear crate719 )
    ( surface-at pallet30 place672 )
    ( surface-at crate30 place672 )
    ( on crate30 pallet30 )
    ( is-crate crate30 )
    ( clear crate30 )
    ( surface-at pallet304 place504 )
    ( surface-at crate304 place504 )
    ( on crate304 pallet304 )
    ( is-crate crate304 )
    ( clear crate304 )
    ( surface-at pallet586 place696 )
    ( surface-at crate586 place696 )
    ( on crate586 pallet586 )
    ( is-crate crate586 )
    ( clear crate586 )
    ( surface-at pallet436 place601 )
    ( surface-at crate436 place601 )
    ( on crate436 pallet436 )
    ( is-crate crate436 )
    ( clear crate436 )
    ( surface-at pallet822 place289 )
    ( surface-at crate822 place289 )
    ( on crate822 pallet822 )
    ( is-crate crate822 )
    ( clear crate822 )
    ( surface-at pallet872 place289 )
    ( surface-at crate872 place289 )
    ( on crate872 pallet872 )
    ( is-crate crate872 )
    ( clear crate872 )
    ( surface-at pallet909 place538 )
    ( surface-at crate909 place538 )
    ( on crate909 pallet909 )
    ( is-crate crate909 )
    ( clear crate909 )
  )
  ( :tasks
    ( Make-13Crate crate797 crate104 crate654 crate365 crate900 crate719 crate30 crate304 crate586 crate436 crate822 crate872 crate909 l000 )
  )
)
