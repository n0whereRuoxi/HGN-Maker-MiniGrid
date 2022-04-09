( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place593 - place
    hoist593 - hoist
    place646 - place
    hoist646 - hoist
    place605 - place
    hoist605 - hoist
    place644 - place
    hoist644 - hoist
    place278 - place
    hoist278 - hoist
    place636 - place
    hoist636 - hoist
    place898 - place
    hoist898 - hoist
    place736 - place
    hoist736 - hoist
    place354 - place
    hoist354 - hoist
    place163 - place
    hoist163 - hoist
    place508 - place
    hoist508 - hoist
    place725 - place
    hoist725 - hoist
    place750 - place
    hoist750 - hoist
    place871 - place
    hoist871 - hoist
    place628 - place
    hoist628 - hoist
    place465 - place
    hoist465 - hoist
    place994 - place
    hoist994 - hoist
    place864 - place
    hoist864 - hoist
    place686 - place
    hoist686 - hoist
    place952 - place
    hoist952 - hoist
    place228 - place
    hoist228 - hoist
    place786 - place
    hoist786 - hoist
    place937 - place
    hoist937 - hoist
    place855 - place
    hoist855 - hoist
    place489 - place
    hoist489 - hoist
    place912 - place
    hoist912 - hoist
    place0 - place
    hoist0 - hoist
    crate288 - surface
    pallet288 - surface
    crate24 - surface
    pallet24 - surface
    crate692 - surface
    pallet692 - surface
    crate938 - surface
    pallet938 - surface
    crate890 - surface
    pallet890 - surface
    crate953 - surface
    pallet953 - surface
    crate551 - surface
    pallet551 - surface
    crate417 - surface
    pallet417 - surface
    crate397 - surface
    pallet397 - surface
    crate536 - surface
    pallet536 - surface
    crate941 - surface
    pallet941 - surface
    crate298 - surface
    pallet298 - surface
    crate812 - surface
    pallet812 - surface
    crate820 - surface
    pallet820 - surface
    crate512 - surface
    pallet512 - surface
    crate336 - surface
    pallet336 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist593 place593 )
    ( available hoist593 )
    ( hoist-at hoist646 place646 )
    ( available hoist646 )
    ( hoist-at hoist605 place605 )
    ( available hoist605 )
    ( hoist-at hoist644 place644 )
    ( available hoist644 )
    ( hoist-at hoist278 place278 )
    ( available hoist278 )
    ( hoist-at hoist636 place636 )
    ( available hoist636 )
    ( hoist-at hoist898 place898 )
    ( available hoist898 )
    ( hoist-at hoist736 place736 )
    ( available hoist736 )
    ( hoist-at hoist354 place354 )
    ( available hoist354 )
    ( hoist-at hoist163 place163 )
    ( available hoist163 )
    ( hoist-at hoist508 place508 )
    ( available hoist508 )
    ( hoist-at hoist725 place725 )
    ( available hoist725 )
    ( hoist-at hoist750 place750 )
    ( available hoist750 )
    ( hoist-at hoist871 place871 )
    ( available hoist871 )
    ( hoist-at hoist628 place628 )
    ( available hoist628 )
    ( hoist-at hoist465 place465 )
    ( available hoist465 )
    ( hoist-at hoist994 place994 )
    ( available hoist994 )
    ( hoist-at hoist864 place864 )
    ( available hoist864 )
    ( hoist-at hoist686 place686 )
    ( available hoist686 )
    ( hoist-at hoist952 place952 )
    ( available hoist952 )
    ( hoist-at hoist228 place228 )
    ( available hoist228 )
    ( hoist-at hoist786 place786 )
    ( available hoist786 )
    ( hoist-at hoist937 place937 )
    ( available hoist937 )
    ( hoist-at hoist855 place855 )
    ( available hoist855 )
    ( hoist-at hoist489 place489 )
    ( available hoist489 )
    ( hoist-at hoist912 place912 )
    ( available hoist912 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet288 place912 )
    ( surface-at crate288 place912 )
    ( on crate288 pallet288 )
    ( is-crate crate288 )
    ( clear crate288 )
    ( surface-at pallet24 place605 )
    ( surface-at crate24 place605 )
    ( on crate24 pallet24 )
    ( is-crate crate24 )
    ( clear crate24 )
    ( surface-at pallet692 place354 )
    ( surface-at crate692 place354 )
    ( on crate692 pallet692 )
    ( is-crate crate692 )
    ( clear crate692 )
    ( surface-at pallet938 place952 )
    ( surface-at crate938 place952 )
    ( on crate938 pallet938 )
    ( is-crate crate938 )
    ( clear crate938 )
    ( surface-at pallet890 place593 )
    ( surface-at crate890 place593 )
    ( on crate890 pallet890 )
    ( is-crate crate890 )
    ( clear crate890 )
    ( surface-at pallet953 place994 )
    ( surface-at crate953 place994 )
    ( on crate953 pallet953 )
    ( is-crate crate953 )
    ( clear crate953 )
    ( surface-at pallet551 place163 )
    ( surface-at crate551 place163 )
    ( on crate551 pallet551 )
    ( is-crate crate551 )
    ( clear crate551 )
    ( surface-at pallet417 place855 )
    ( surface-at crate417 place855 )
    ( on crate417 pallet417 )
    ( is-crate crate417 )
    ( clear crate417 )
    ( surface-at pallet397 place786 )
    ( surface-at crate397 place786 )
    ( on crate397 pallet397 )
    ( is-crate crate397 )
    ( clear crate397 )
    ( surface-at pallet536 place736 )
    ( surface-at crate536 place736 )
    ( on crate536 pallet536 )
    ( is-crate crate536 )
    ( clear crate536 )
    ( surface-at pallet941 place736 )
    ( surface-at crate941 place736 )
    ( on crate941 pallet941 )
    ( is-crate crate941 )
    ( clear crate941 )
    ( surface-at pallet298 place636 )
    ( surface-at crate298 place636 )
    ( on crate298 pallet298 )
    ( is-crate crate298 )
    ( clear crate298 )
    ( surface-at pallet812 place644 )
    ( surface-at crate812 place644 )
    ( on crate812 pallet812 )
    ( is-crate crate812 )
    ( clear crate812 )
    ( surface-at pallet820 place228 )
    ( surface-at crate820 place228 )
    ( on crate820 pallet820 )
    ( is-crate crate820 )
    ( clear crate820 )
    ( surface-at pallet512 place952 )
    ( surface-at crate512 place952 )
    ( on crate512 pallet512 )
    ( is-crate crate512 )
    ( clear crate512 )
    ( surface-at pallet336 place489 )
    ( surface-at crate336 place489 )
    ( on crate336 pallet336 )
    ( is-crate crate336 )
    ( clear crate336 )
  )
  ( :goal
    ( and
    )
  )
)
