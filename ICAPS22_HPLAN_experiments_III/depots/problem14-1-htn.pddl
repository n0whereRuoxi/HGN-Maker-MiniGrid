( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place262 - place
    hoist262 - hoist
    place308 - place
    hoist308 - hoist
    place511 - place
    hoist511 - hoist
    place567 - place
    hoist567 - hoist
    place768 - place
    hoist768 - hoist
    place797 - place
    hoist797 - hoist
    place521 - place
    hoist521 - hoist
    place914 - place
    hoist914 - hoist
    place889 - place
    hoist889 - hoist
    place58 - place
    hoist58 - hoist
    place2 - place
    hoist2 - hoist
    place225 - place
    hoist225 - hoist
    place605 - place
    hoist605 - hoist
    place912 - place
    hoist912 - hoist
    place824 - place
    hoist824 - hoist
    place310 - place
    hoist310 - hoist
    place830 - place
    hoist830 - hoist
    place155 - place
    hoist155 - hoist
    place302 - place
    hoist302 - hoist
    place447 - place
    hoist447 - hoist
    place0 - place
    hoist0 - hoist
    crate713 - surface
    pallet713 - surface
    crate642 - surface
    pallet642 - surface
    crate427 - surface
    pallet427 - surface
    crate388 - surface
    pallet388 - surface
    crate456 - surface
    pallet456 - surface
    crate444 - surface
    pallet444 - surface
    crate982 - surface
    pallet982 - surface
    crate438 - surface
    pallet438 - surface
    crate254 - surface
    pallet254 - surface
    crate706 - surface
    pallet706 - surface
    crate626 - surface
    pallet626 - surface
    crate345 - surface
    pallet345 - surface
    crate808 - surface
    pallet808 - surface
    crate126 - surface
    pallet126 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist262 place262 )
    ( available hoist262 )
    ( hoist-at hoist308 place308 )
    ( available hoist308 )
    ( hoist-at hoist511 place511 )
    ( available hoist511 )
    ( hoist-at hoist567 place567 )
    ( available hoist567 )
    ( hoist-at hoist768 place768 )
    ( available hoist768 )
    ( hoist-at hoist797 place797 )
    ( available hoist797 )
    ( hoist-at hoist521 place521 )
    ( available hoist521 )
    ( hoist-at hoist914 place914 )
    ( available hoist914 )
    ( hoist-at hoist889 place889 )
    ( available hoist889 )
    ( hoist-at hoist58 place58 )
    ( available hoist58 )
    ( hoist-at hoist2 place2 )
    ( available hoist2 )
    ( hoist-at hoist225 place225 )
    ( available hoist225 )
    ( hoist-at hoist605 place605 )
    ( available hoist605 )
    ( hoist-at hoist912 place912 )
    ( available hoist912 )
    ( hoist-at hoist824 place824 )
    ( available hoist824 )
    ( hoist-at hoist310 place310 )
    ( available hoist310 )
    ( hoist-at hoist830 place830 )
    ( available hoist830 )
    ( hoist-at hoist155 place155 )
    ( available hoist155 )
    ( hoist-at hoist302 place302 )
    ( available hoist302 )
    ( hoist-at hoist447 place447 )
    ( available hoist447 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet713 place58 )
    ( surface-at crate713 place58 )
    ( on crate713 pallet713 )
    ( is-crate crate713 )
    ( clear crate713 )
    ( surface-at pallet642 place889 )
    ( surface-at crate642 place889 )
    ( on crate642 pallet642 )
    ( is-crate crate642 )
    ( clear crate642 )
    ( surface-at pallet427 place58 )
    ( surface-at crate427 place58 )
    ( on crate427 pallet427 )
    ( is-crate crate427 )
    ( clear crate427 )
    ( surface-at pallet388 place912 )
    ( surface-at crate388 place912 )
    ( on crate388 pallet388 )
    ( is-crate crate388 )
    ( clear crate388 )
    ( surface-at pallet456 place308 )
    ( surface-at crate456 place308 )
    ( on crate456 pallet456 )
    ( is-crate crate456 )
    ( clear crate456 )
    ( surface-at pallet444 place511 )
    ( surface-at crate444 place511 )
    ( on crate444 pallet444 )
    ( is-crate crate444 )
    ( clear crate444 )
    ( surface-at pallet982 place262 )
    ( surface-at crate982 place262 )
    ( on crate982 pallet982 )
    ( is-crate crate982 )
    ( clear crate982 )
    ( surface-at pallet438 place447 )
    ( surface-at crate438 place447 )
    ( on crate438 pallet438 )
    ( is-crate crate438 )
    ( clear crate438 )
    ( surface-at pallet254 place567 )
    ( surface-at crate254 place567 )
    ( on crate254 pallet254 )
    ( is-crate crate254 )
    ( clear crate254 )
    ( surface-at pallet706 place225 )
    ( surface-at crate706 place225 )
    ( on crate706 pallet706 )
    ( is-crate crate706 )
    ( clear crate706 )
    ( surface-at pallet626 place797 )
    ( surface-at crate626 place797 )
    ( on crate626 pallet626 )
    ( is-crate crate626 )
    ( clear crate626 )
    ( surface-at pallet345 place521 )
    ( surface-at crate345 place521 )
    ( on crate345 pallet345 )
    ( is-crate crate345 )
    ( clear crate345 )
    ( surface-at pallet808 place447 )
    ( surface-at crate808 place447 )
    ( on crate808 pallet808 )
    ( is-crate crate808 )
    ( clear crate808 )
    ( surface-at pallet126 place2 )
    ( surface-at crate126 place2 )
    ( on crate126 pallet126 )
    ( is-crate crate126 )
    ( clear crate126 )
  )
  ( :tasks
    ( Make-14Crate crate713 crate642 crate427 crate388 crate456 crate444 crate982 crate438 crate254 crate706 crate626 crate345 crate808 crate126 l000 )
  )
)
