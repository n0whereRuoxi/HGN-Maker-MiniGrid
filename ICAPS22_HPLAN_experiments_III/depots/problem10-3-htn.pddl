( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place13 - place
    hoist13 - hoist
    place274 - place
    hoist274 - hoist
    place216 - place
    hoist216 - hoist
    place596 - place
    hoist596 - hoist
    place888 - place
    hoist888 - hoist
    place566 - place
    hoist566 - hoist
    place583 - place
    hoist583 - hoist
    place757 - place
    hoist757 - hoist
    place753 - place
    hoist753 - hoist
    place0 - place
    hoist0 - hoist
    crate806 - surface
    pallet806 - surface
    crate458 - surface
    pallet458 - surface
    crate532 - surface
    pallet532 - surface
    crate55 - surface
    pallet55 - surface
    crate41 - surface
    pallet41 - surface
    crate631 - surface
    pallet631 - surface
    crate254 - surface
    pallet254 - surface
    crate876 - surface
    pallet876 - surface
    crate724 - surface
    pallet724 - surface
    crate635 - surface
    pallet635 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist13 place13 )
    ( available hoist13 )
    ( hoist-at hoist274 place274 )
    ( available hoist274 )
    ( hoist-at hoist216 place216 )
    ( available hoist216 )
    ( hoist-at hoist596 place596 )
    ( available hoist596 )
    ( hoist-at hoist888 place888 )
    ( available hoist888 )
    ( hoist-at hoist566 place566 )
    ( available hoist566 )
    ( hoist-at hoist583 place583 )
    ( available hoist583 )
    ( hoist-at hoist757 place757 )
    ( available hoist757 )
    ( hoist-at hoist753 place753 )
    ( available hoist753 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet806 place583 )
    ( surface-at crate806 place583 )
    ( on crate806 pallet806 )
    ( is-crate crate806 )
    ( clear crate806 )
    ( surface-at pallet458 place753 )
    ( surface-at crate458 place753 )
    ( on crate458 pallet458 )
    ( is-crate crate458 )
    ( clear crate458 )
    ( surface-at pallet532 place583 )
    ( surface-at crate532 place583 )
    ( on crate532 pallet532 )
    ( is-crate crate532 )
    ( clear crate532 )
    ( surface-at pallet55 place757 )
    ( surface-at crate55 place757 )
    ( on crate55 pallet55 )
    ( is-crate crate55 )
    ( clear crate55 )
    ( surface-at pallet41 place583 )
    ( surface-at crate41 place583 )
    ( on crate41 pallet41 )
    ( is-crate crate41 )
    ( clear crate41 )
    ( surface-at pallet631 place753 )
    ( surface-at crate631 place753 )
    ( on crate631 pallet631 )
    ( is-crate crate631 )
    ( clear crate631 )
    ( surface-at pallet254 place753 )
    ( surface-at crate254 place753 )
    ( on crate254 pallet254 )
    ( is-crate crate254 )
    ( clear crate254 )
    ( surface-at pallet876 place596 )
    ( surface-at crate876 place596 )
    ( on crate876 pallet876 )
    ( is-crate crate876 )
    ( clear crate876 )
    ( surface-at pallet724 place216 )
    ( surface-at crate724 place216 )
    ( on crate724 pallet724 )
    ( is-crate crate724 )
    ( clear crate724 )
    ( surface-at pallet635 place13 )
    ( surface-at crate635 place13 )
    ( on crate635 pallet635 )
    ( is-crate crate635 )
    ( clear crate635 )
  )
  ( :tasks
    ( Make-10Crate crate806 crate458 crate532 crate55 crate41 crate631 crate254 crate876 crate724 crate635 l000 )
  )
)
