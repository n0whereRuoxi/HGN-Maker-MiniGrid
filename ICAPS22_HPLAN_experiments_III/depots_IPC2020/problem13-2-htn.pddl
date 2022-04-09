( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place264 - place
    hoist264 - hoist
    place960 - place
    hoist960 - hoist
    place291 - place
    hoist291 - hoist
    place868 - place
    hoist868 - hoist
    place861 - place
    hoist861 - hoist
    place953 - place
    hoist953 - hoist
    place375 - place
    hoist375 - hoist
    place310 - place
    hoist310 - hoist
    place474 - place
    hoist474 - hoist
    place0 - place
    hoist0 - hoist
    crate480 - surface
    pallet480 - surface
    crate302 - surface
    pallet302 - surface
    crate456 - surface
    pallet456 - surface
    crate507 - surface
    pallet507 - surface
    crate421 - surface
    pallet421 - surface
    crate450 - surface
    pallet450 - surface
    crate248 - surface
    pallet248 - surface
    crate710 - surface
    pallet710 - surface
    crate886 - surface
    pallet886 - surface
    crate984 - surface
    pallet984 - surface
    crate40 - surface
    pallet40 - surface
    crate441 - surface
    pallet441 - surface
    crate606 - surface
    pallet606 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist264 place264 )
    ( available hoist264 )
    ( hoist-at hoist960 place960 )
    ( available hoist960 )
    ( hoist-at hoist291 place291 )
    ( available hoist291 )
    ( hoist-at hoist868 place868 )
    ( available hoist868 )
    ( hoist-at hoist861 place861 )
    ( available hoist861 )
    ( hoist-at hoist953 place953 )
    ( available hoist953 )
    ( hoist-at hoist375 place375 )
    ( available hoist375 )
    ( hoist-at hoist310 place310 )
    ( available hoist310 )
    ( hoist-at hoist474 place474 )
    ( available hoist474 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet480 place861 )
    ( surface-at crate480 place861 )
    ( on crate480 pallet480 )
    ( is-crate crate480 )
    ( clear crate480 )
    ( surface-at pallet302 place264 )
    ( surface-at crate302 place264 )
    ( on crate302 pallet302 )
    ( is-crate crate302 )
    ( clear crate302 )
    ( surface-at pallet456 place868 )
    ( surface-at crate456 place868 )
    ( on crate456 pallet456 )
    ( is-crate crate456 )
    ( clear crate456 )
    ( surface-at pallet507 place861 )
    ( surface-at crate507 place861 )
    ( on crate507 pallet507 )
    ( is-crate crate507 )
    ( clear crate507 )
    ( surface-at pallet421 place291 )
    ( surface-at crate421 place291 )
    ( on crate421 pallet421 )
    ( is-crate crate421 )
    ( clear crate421 )
    ( surface-at pallet450 place861 )
    ( surface-at crate450 place861 )
    ( on crate450 pallet450 )
    ( is-crate crate450 )
    ( clear crate450 )
    ( surface-at pallet248 place375 )
    ( surface-at crate248 place375 )
    ( on crate248 pallet248 )
    ( is-crate crate248 )
    ( clear crate248 )
    ( surface-at pallet710 place868 )
    ( surface-at crate710 place868 )
    ( on crate710 pallet710 )
    ( is-crate crate710 )
    ( clear crate710 )
    ( surface-at pallet886 place291 )
    ( surface-at crate886 place291 )
    ( on crate886 pallet886 )
    ( is-crate crate886 )
    ( clear crate886 )
    ( surface-at pallet984 place861 )
    ( surface-at crate984 place861 )
    ( on crate984 pallet984 )
    ( is-crate crate984 )
    ( clear crate984 )
    ( surface-at pallet40 place861 )
    ( surface-at crate40 place861 )
    ( on crate40 pallet40 )
    ( is-crate crate40 )
    ( clear crate40 )
    ( surface-at pallet441 place953 )
    ( surface-at crate441 place953 )
    ( on crate441 pallet441 )
    ( is-crate crate441 )
    ( clear crate441 )
    ( surface-at pallet606 place291 )
    ( surface-at crate606 place291 )
    ( on crate606 pallet606 )
    ( is-crate crate606 )
    ( clear crate606 )
  )
  ( :tasks
    ( Make-13Crate pallet0 crate480 crate302 crate456 crate507 crate421 crate450 crate248 crate710 crate886 crate984 crate40 crate441 crate606 )
  )
)
