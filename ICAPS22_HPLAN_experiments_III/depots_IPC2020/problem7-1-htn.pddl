( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place791 - place
    hoist791 - hoist
    place726 - place
    hoist726 - hoist
    place343 - place
    hoist343 - hoist
    place946 - place
    hoist946 - hoist
    place340 - place
    hoist340 - hoist
    place714 - place
    hoist714 - hoist
    place757 - place
    hoist757 - hoist
    place929 - place
    hoist929 - hoist
    place103 - place
    hoist103 - hoist
    place598 - place
    hoist598 - hoist
    place0 - place
    hoist0 - hoist
    crate435 - surface
    pallet435 - surface
    crate744 - surface
    pallet744 - surface
    crate76 - surface
    pallet76 - surface
    crate833 - surface
    pallet833 - surface
    crate952 - surface
    pallet952 - surface
    crate762 - surface
    pallet762 - surface
    crate459 - surface
    pallet459 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist791 place791 )
    ( available hoist791 )
    ( hoist-at hoist726 place726 )
    ( available hoist726 )
    ( hoist-at hoist343 place343 )
    ( available hoist343 )
    ( hoist-at hoist946 place946 )
    ( available hoist946 )
    ( hoist-at hoist340 place340 )
    ( available hoist340 )
    ( hoist-at hoist714 place714 )
    ( available hoist714 )
    ( hoist-at hoist757 place757 )
    ( available hoist757 )
    ( hoist-at hoist929 place929 )
    ( available hoist929 )
    ( hoist-at hoist103 place103 )
    ( available hoist103 )
    ( hoist-at hoist598 place598 )
    ( available hoist598 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet435 place791 )
    ( surface-at crate435 place791 )
    ( on crate435 pallet435 )
    ( is-crate crate435 )
    ( clear crate435 )
    ( surface-at pallet744 place946 )
    ( surface-at crate744 place946 )
    ( on crate744 pallet744 )
    ( is-crate crate744 )
    ( clear crate744 )
    ( surface-at pallet76 place598 )
    ( surface-at crate76 place598 )
    ( on crate76 pallet76 )
    ( is-crate crate76 )
    ( clear crate76 )
    ( surface-at pallet833 place343 )
    ( surface-at crate833 place343 )
    ( on crate833 pallet833 )
    ( is-crate crate833 )
    ( clear crate833 )
    ( surface-at pallet952 place714 )
    ( surface-at crate952 place714 )
    ( on crate952 pallet952 )
    ( is-crate crate952 )
    ( clear crate952 )
    ( surface-at pallet762 place791 )
    ( surface-at crate762 place791 )
    ( on crate762 pallet762 )
    ( is-crate crate762 )
    ( clear crate762 )
    ( surface-at pallet459 place929 )
    ( surface-at crate459 place929 )
    ( on crate459 pallet459 )
    ( is-crate crate459 )
    ( clear crate459 )
  )
  ( :tasks
    ( Make-7Crate pallet0 crate435 crate744 crate76 crate833 crate952 crate762 crate459 )
  )
)
