( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    place695 - place
    hoist695 - hoist
    place96 - place
    hoist96 - hoist
    place655 - place
    hoist655 - hoist
    place908 - place
    hoist908 - hoist
    place614 - place
    hoist614 - hoist
    place801 - place
    hoist801 - hoist
    place521 - place
    hoist521 - hoist
    place628 - place
    hoist628 - hoist
    place723 - place
    hoist723 - hoist
    place0 - place
    hoist0 - hoist
    crate713 - surface
    pallet713 - surface
    crate745 - surface
    pallet745 - surface
    crate752 - surface
    pallet752 - surface
    crate552 - surface
    pallet552 - surface
    crate166 - surface
    pallet166 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist695 place695 )
    ( available hoist695 )
    ( hoist-at hoist96 place96 )
    ( available hoist96 )
    ( hoist-at hoist655 place655 )
    ( available hoist655 )
    ( hoist-at hoist908 place908 )
    ( available hoist908 )
    ( hoist-at hoist614 place614 )
    ( available hoist614 )
    ( hoist-at hoist801 place801 )
    ( available hoist801 )
    ( hoist-at hoist521 place521 )
    ( available hoist521 )
    ( hoist-at hoist628 place628 )
    ( available hoist628 )
    ( hoist-at hoist723 place723 )
    ( available hoist723 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet713 place723 )
    ( surface-at crate713 place723 )
    ( on crate713 pallet713 )
    ( is-crate crate713 )
    ( clear crate713 )
    ( surface-at pallet745 place655 )
    ( surface-at crate745 place655 )
    ( on crate745 pallet745 )
    ( is-crate crate745 )
    ( clear crate745 )
    ( surface-at pallet752 place655 )
    ( surface-at crate752 place655 )
    ( on crate752 pallet752 )
    ( is-crate crate752 )
    ( clear crate752 )
    ( surface-at pallet552 place723 )
    ( surface-at crate552 place723 )
    ( on crate552 pallet552 )
    ( is-crate crate552 )
    ( clear crate552 )
    ( surface-at pallet166 place723 )
    ( surface-at crate166 place723 )
    ( on crate166 pallet166 )
    ( is-crate crate166 )
    ( clear crate166 )
  )
  ( :tasks
    ( Make-5Crate crate713 crate745 crate752 crate552 crate166 l000 )
  )
)
