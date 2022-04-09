( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place322 - place
    hoist322 - hoist
    place802 - place
    hoist802 - hoist
    place339 - place
    hoist339 - hoist
    place41 - place
    hoist41 - hoist
    place12 - place
    hoist12 - hoist
    place710 - place
    hoist710 - hoist
    place0 - place
    hoist0 - hoist
    crate465 - surface
    pallet465 - surface
    crate946 - surface
    pallet946 - surface
    crate355 - surface
    pallet355 - surface
    crate982 - surface
    pallet982 - surface
    crate356 - surface
    pallet356 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist322 place322 )
    ( available hoist322 )
    ( hoist-at hoist802 place802 )
    ( available hoist802 )
    ( hoist-at hoist339 place339 )
    ( available hoist339 )
    ( hoist-at hoist41 place41 )
    ( available hoist41 )
    ( hoist-at hoist12 place12 )
    ( available hoist12 )
    ( hoist-at hoist710 place710 )
    ( available hoist710 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet465 place12 )
    ( surface-at crate465 place12 )
    ( on crate465 pallet465 )
    ( is-crate crate465 )
    ( clear crate465 )
    ( surface-at pallet946 place802 )
    ( surface-at crate946 place802 )
    ( on crate946 pallet946 )
    ( is-crate crate946 )
    ( clear crate946 )
    ( surface-at pallet355 place41 )
    ( surface-at crate355 place41 )
    ( on crate355 pallet355 )
    ( is-crate crate355 )
    ( clear crate355 )
    ( surface-at pallet982 place41 )
    ( surface-at crate982 place41 )
    ( on crate982 pallet982 )
    ( is-crate crate982 )
    ( clear crate982 )
    ( surface-at pallet356 place322 )
    ( surface-at crate356 place322 )
    ( on crate356 pallet356 )
    ( is-crate crate356 )
    ( clear crate356 )
  )
  ( :tasks
    ( Make-5Crate pallet0 crate465 crate946 crate355 crate982 crate356 )
  )
)
