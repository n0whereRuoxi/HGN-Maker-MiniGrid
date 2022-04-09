( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place766 - place
    hoist766 - hoist
    place592 - place
    hoist592 - hoist
    place144 - place
    hoist144 - hoist
    place618 - place
    hoist618 - hoist
    place0 - place
    hoist0 - hoist
    crate48 - surface
    pallet48 - surface
    crate397 - surface
    pallet397 - surface
    crate613 - surface
    pallet613 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist766 place766 )
    ( available hoist766 )
    ( hoist-at hoist592 place592 )
    ( available hoist592 )
    ( hoist-at hoist144 place144 )
    ( available hoist144 )
    ( hoist-at hoist618 place618 )
    ( available hoist618 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet48 place766 )
    ( surface-at crate48 place766 )
    ( on crate48 pallet48 )
    ( is-crate crate48 )
    ( clear crate48 )
    ( surface-at pallet397 place144 )
    ( surface-at crate397 place144 )
    ( on crate397 pallet397 )
    ( is-crate crate397 )
    ( clear crate397 )
    ( surface-at pallet613 place618 )
    ( surface-at crate613 place618 )
    ( on crate613 pallet613 )
    ( is-crate crate613 )
    ( clear crate613 )
  )
  ( :tasks
    ( Make-3Crate crate48 crate397 crate613 l000 )
  )
)
