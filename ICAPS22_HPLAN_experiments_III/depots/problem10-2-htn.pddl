( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place397 - place
    hoist397 - hoist
    place318 - place
    hoist318 - hoist
    place187 - place
    hoist187 - hoist
    place367 - place
    hoist367 - hoist
    place936 - place
    hoist936 - hoist
    place104 - place
    hoist104 - hoist
    place599 - place
    hoist599 - hoist
    place872 - place
    hoist872 - hoist
    place806 - place
    hoist806 - hoist
    place158 - place
    hoist158 - hoist
    place565 - place
    hoist565 - hoist
    place163 - place
    hoist163 - hoist
    place0 - place
    hoist0 - hoist
    crate123 - surface
    pallet123 - surface
    crate343 - surface
    pallet343 - surface
    crate671 - surface
    pallet671 - surface
    crate595 - surface
    pallet595 - surface
    crate812 - surface
    pallet812 - surface
    crate182 - surface
    pallet182 - surface
    crate958 - surface
    pallet958 - surface
    crate631 - surface
    pallet631 - surface
    crate86 - surface
    pallet86 - surface
    crate452 - surface
    pallet452 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist397 place397 )
    ( available hoist397 )
    ( hoist-at hoist318 place318 )
    ( available hoist318 )
    ( hoist-at hoist187 place187 )
    ( available hoist187 )
    ( hoist-at hoist367 place367 )
    ( available hoist367 )
    ( hoist-at hoist936 place936 )
    ( available hoist936 )
    ( hoist-at hoist104 place104 )
    ( available hoist104 )
    ( hoist-at hoist599 place599 )
    ( available hoist599 )
    ( hoist-at hoist872 place872 )
    ( available hoist872 )
    ( hoist-at hoist806 place806 )
    ( available hoist806 )
    ( hoist-at hoist158 place158 )
    ( available hoist158 )
    ( hoist-at hoist565 place565 )
    ( available hoist565 )
    ( hoist-at hoist163 place163 )
    ( available hoist163 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet123 place806 )
    ( surface-at crate123 place806 )
    ( on crate123 pallet123 )
    ( is-crate crate123 )
    ( clear crate123 )
    ( surface-at pallet343 place806 )
    ( surface-at crate343 place806 )
    ( on crate343 pallet343 )
    ( is-crate crate343 )
    ( clear crate343 )
    ( surface-at pallet671 place936 )
    ( surface-at crate671 place936 )
    ( on crate671 pallet671 )
    ( is-crate crate671 )
    ( clear crate671 )
    ( surface-at pallet595 place936 )
    ( surface-at crate595 place936 )
    ( on crate595 pallet595 )
    ( is-crate crate595 )
    ( clear crate595 )
    ( surface-at pallet812 place872 )
    ( surface-at crate812 place872 )
    ( on crate812 pallet812 )
    ( is-crate crate812 )
    ( clear crate812 )
    ( surface-at pallet182 place806 )
    ( surface-at crate182 place806 )
    ( on crate182 pallet182 )
    ( is-crate crate182 )
    ( clear crate182 )
    ( surface-at pallet958 place318 )
    ( surface-at crate958 place318 )
    ( on crate958 pallet958 )
    ( is-crate crate958 )
    ( clear crate958 )
    ( surface-at pallet631 place397 )
    ( surface-at crate631 place397 )
    ( on crate631 pallet631 )
    ( is-crate crate631 )
    ( clear crate631 )
    ( surface-at pallet86 place806 )
    ( surface-at crate86 place806 )
    ( on crate86 pallet86 )
    ( is-crate crate86 )
    ( clear crate86 )
    ( surface-at pallet452 place565 )
    ( surface-at crate452 place565 )
    ( on crate452 pallet452 )
    ( is-crate crate452 )
    ( clear crate452 )
  )
  ( :tasks
    ( Make-10Crate crate123 crate343 crate671 crate595 crate812 crate182 crate958 crate631 crate86 crate452 l000 )
  )
)
