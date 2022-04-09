( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place960 - place
    hoist960 - hoist
    place790 - place
    hoist790 - hoist
    place148 - place
    hoist148 - hoist
    place452 - place
    hoist452 - hoist
    place822 - place
    hoist822 - hoist
    place462 - place
    hoist462 - hoist
    place0 - place
    hoist0 - hoist
    crate772 - surface
    pallet772 - surface
    crate373 - surface
    pallet373 - surface
    crate810 - surface
    pallet810 - surface
    crate885 - surface
    pallet885 - surface
    crate237 - surface
    pallet237 - surface
    crate941 - surface
    pallet941 - surface
    crate768 - surface
    pallet768 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist960 place960 )
    ( available hoist960 )
    ( hoist-at hoist790 place790 )
    ( available hoist790 )
    ( hoist-at hoist148 place148 )
    ( available hoist148 )
    ( hoist-at hoist452 place452 )
    ( available hoist452 )
    ( hoist-at hoist822 place822 )
    ( available hoist822 )
    ( hoist-at hoist462 place462 )
    ( available hoist462 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet772 place148 )
    ( surface-at crate772 place148 )
    ( on crate772 pallet772 )
    ( is-crate crate772 )
    ( clear crate772 )
    ( surface-at pallet373 place462 )
    ( surface-at crate373 place462 )
    ( on crate373 pallet373 )
    ( is-crate crate373 )
    ( clear crate373 )
    ( surface-at pallet810 place148 )
    ( surface-at crate810 place148 )
    ( on crate810 pallet810 )
    ( is-crate crate810 )
    ( clear crate810 )
    ( surface-at pallet885 place462 )
    ( surface-at crate885 place462 )
    ( on crate885 pallet885 )
    ( is-crate crate885 )
    ( clear crate885 )
    ( surface-at pallet237 place960 )
    ( surface-at crate237 place960 )
    ( on crate237 pallet237 )
    ( is-crate crate237 )
    ( clear crate237 )
    ( surface-at pallet941 place822 )
    ( surface-at crate941 place822 )
    ( on crate941 pallet941 )
    ( is-crate crate941 )
    ( clear crate941 )
    ( surface-at pallet768 place452 )
    ( surface-at crate768 place452 )
    ( on crate768 pallet768 )
    ( is-crate crate768 )
    ( clear crate768 )
  )
  ( :tasks
    ( Make-7Crate pallet0 crate772 crate373 crate810 crate885 crate237 crate941 crate768 )
  )
)
