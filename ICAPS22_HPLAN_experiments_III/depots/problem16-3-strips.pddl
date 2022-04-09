( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place571 - place
    hoist571 - hoist
    place108 - place
    hoist108 - hoist
    place419 - place
    hoist419 - hoist
    place933 - place
    hoist933 - hoist
    place807 - place
    hoist807 - hoist
    place345 - place
    hoist345 - hoist
    place324 - place
    hoist324 - hoist
    place75 - place
    hoist75 - hoist
    place789 - place
    hoist789 - hoist
    place956 - place
    hoist956 - hoist
    place928 - place
    hoist928 - hoist
    place849 - place
    hoist849 - hoist
    place746 - place
    hoist746 - hoist
    place164 - place
    hoist164 - hoist
    place443 - place
    hoist443 - hoist
    place182 - place
    hoist182 - hoist
    place0 - place
    hoist0 - hoist
    crate664 - surface
    pallet664 - surface
    crate430 - surface
    pallet430 - surface
    crate138 - surface
    pallet138 - surface
    crate348 - surface
    pallet348 - surface
    crate360 - surface
    pallet360 - surface
    crate821 - surface
    pallet821 - surface
    crate202 - surface
    pallet202 - surface
    crate679 - surface
    pallet679 - surface
    crate717 - surface
    pallet717 - surface
    crate429 - surface
    pallet429 - surface
    crate136 - surface
    pallet136 - surface
    crate241 - surface
    pallet241 - surface
    crate587 - surface
    pallet587 - surface
    crate167 - surface
    pallet167 - surface
    crate33 - surface
    pallet33 - surface
    crate500 - surface
    pallet500 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist571 place571 )
    ( available hoist571 )
    ( hoist-at hoist108 place108 )
    ( available hoist108 )
    ( hoist-at hoist419 place419 )
    ( available hoist419 )
    ( hoist-at hoist933 place933 )
    ( available hoist933 )
    ( hoist-at hoist807 place807 )
    ( available hoist807 )
    ( hoist-at hoist345 place345 )
    ( available hoist345 )
    ( hoist-at hoist324 place324 )
    ( available hoist324 )
    ( hoist-at hoist75 place75 )
    ( available hoist75 )
    ( hoist-at hoist789 place789 )
    ( available hoist789 )
    ( hoist-at hoist956 place956 )
    ( available hoist956 )
    ( hoist-at hoist928 place928 )
    ( available hoist928 )
    ( hoist-at hoist849 place849 )
    ( available hoist849 )
    ( hoist-at hoist746 place746 )
    ( available hoist746 )
    ( hoist-at hoist164 place164 )
    ( available hoist164 )
    ( hoist-at hoist443 place443 )
    ( available hoist443 )
    ( hoist-at hoist182 place182 )
    ( available hoist182 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet664 place419 )
    ( surface-at crate664 place419 )
    ( on crate664 pallet664 )
    ( is-crate crate664 )
    ( clear crate664 )
    ( surface-at pallet430 place345 )
    ( surface-at crate430 place345 )
    ( on crate430 pallet430 )
    ( is-crate crate430 )
    ( clear crate430 )
    ( surface-at pallet138 place324 )
    ( surface-at crate138 place324 )
    ( on crate138 pallet138 )
    ( is-crate crate138 )
    ( clear crate138 )
    ( surface-at pallet348 place345 )
    ( surface-at crate348 place345 )
    ( on crate348 pallet348 )
    ( is-crate crate348 )
    ( clear crate348 )
    ( surface-at pallet360 place746 )
    ( surface-at crate360 place746 )
    ( on crate360 pallet360 )
    ( is-crate crate360 )
    ( clear crate360 )
    ( surface-at pallet821 place789 )
    ( surface-at crate821 place789 )
    ( on crate821 pallet821 )
    ( is-crate crate821 )
    ( clear crate821 )
    ( surface-at pallet202 place933 )
    ( surface-at crate202 place933 )
    ( on crate202 pallet202 )
    ( is-crate crate202 )
    ( clear crate202 )
    ( surface-at pallet679 place182 )
    ( surface-at crate679 place182 )
    ( on crate679 pallet679 )
    ( is-crate crate679 )
    ( clear crate679 )
    ( surface-at pallet717 place419 )
    ( surface-at crate717 place419 )
    ( on crate717 pallet717 )
    ( is-crate crate717 )
    ( clear crate717 )
    ( surface-at pallet429 place324 )
    ( surface-at crate429 place324 )
    ( on crate429 pallet429 )
    ( is-crate crate429 )
    ( clear crate429 )
    ( surface-at pallet136 place164 )
    ( surface-at crate136 place164 )
    ( on crate136 pallet136 )
    ( is-crate crate136 )
    ( clear crate136 )
    ( surface-at pallet241 place419 )
    ( surface-at crate241 place419 )
    ( on crate241 pallet241 )
    ( is-crate crate241 )
    ( clear crate241 )
    ( surface-at pallet587 place807 )
    ( surface-at crate587 place807 )
    ( on crate587 pallet587 )
    ( is-crate crate587 )
    ( clear crate587 )
    ( surface-at pallet167 place443 )
    ( surface-at crate167 place443 )
    ( on crate167 pallet167 )
    ( is-crate crate167 )
    ( clear crate167 )
    ( surface-at pallet33 place108 )
    ( surface-at crate33 place108 )
    ( on crate33 pallet33 )
    ( is-crate crate33 )
    ( clear crate33 )
    ( surface-at pallet500 place928 )
    ( surface-at crate500 place928 )
    ( on crate500 pallet500 )
    ( is-crate crate500 )
    ( clear crate500 )
  )
  ( :goal
    ( and
    )
  )
)
