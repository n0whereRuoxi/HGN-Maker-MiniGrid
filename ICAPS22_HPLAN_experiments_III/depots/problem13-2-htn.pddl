( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place178 - place
    hoist178 - hoist
    place574 - place
    hoist574 - hoist
    place300 - place
    hoist300 - hoist
    place812 - place
    hoist812 - hoist
    place210 - place
    hoist210 - hoist
    place215 - place
    hoist215 - hoist
    place75 - place
    hoist75 - hoist
    place760 - place
    hoist760 - hoist
    place721 - place
    hoist721 - hoist
    place0 - place
    hoist0 - hoist
    crate748 - surface
    pallet748 - surface
    crate963 - surface
    pallet963 - surface
    crate910 - surface
    pallet910 - surface
    crate424 - surface
    pallet424 - surface
    crate326 - surface
    pallet326 - surface
    crate904 - surface
    pallet904 - surface
    crate957 - surface
    pallet957 - surface
    crate776 - surface
    pallet776 - surface
    crate430 - surface
    pallet430 - surface
    crate372 - surface
    pallet372 - surface
    crate361 - surface
    pallet361 - surface
    crate109 - surface
    pallet109 - surface
    crate423 - surface
    pallet423 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist178 place178 )
    ( available hoist178 )
    ( hoist-at hoist574 place574 )
    ( available hoist574 )
    ( hoist-at hoist300 place300 )
    ( available hoist300 )
    ( hoist-at hoist812 place812 )
    ( available hoist812 )
    ( hoist-at hoist210 place210 )
    ( available hoist210 )
    ( hoist-at hoist215 place215 )
    ( available hoist215 )
    ( hoist-at hoist75 place75 )
    ( available hoist75 )
    ( hoist-at hoist760 place760 )
    ( available hoist760 )
    ( hoist-at hoist721 place721 )
    ( available hoist721 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet748 place760 )
    ( surface-at crate748 place760 )
    ( on crate748 pallet748 )
    ( is-crate crate748 )
    ( clear crate748 )
    ( surface-at pallet963 place760 )
    ( surface-at crate963 place760 )
    ( on crate963 pallet963 )
    ( is-crate crate963 )
    ( clear crate963 )
    ( surface-at pallet910 place210 )
    ( surface-at crate910 place210 )
    ( on crate910 pallet910 )
    ( is-crate crate910 )
    ( clear crate910 )
    ( surface-at pallet424 place760 )
    ( surface-at crate424 place760 )
    ( on crate424 pallet424 )
    ( is-crate crate424 )
    ( clear crate424 )
    ( surface-at pallet326 place300 )
    ( surface-at crate326 place300 )
    ( on crate326 pallet326 )
    ( is-crate crate326 )
    ( clear crate326 )
    ( surface-at pallet904 place300 )
    ( surface-at crate904 place300 )
    ( on crate904 pallet904 )
    ( is-crate crate904 )
    ( clear crate904 )
    ( surface-at pallet957 place75 )
    ( surface-at crate957 place75 )
    ( on crate957 pallet957 )
    ( is-crate crate957 )
    ( clear crate957 )
    ( surface-at pallet776 place721 )
    ( surface-at crate776 place721 )
    ( on crate776 pallet776 )
    ( is-crate crate776 )
    ( clear crate776 )
    ( surface-at pallet430 place760 )
    ( surface-at crate430 place760 )
    ( on crate430 pallet430 )
    ( is-crate crate430 )
    ( clear crate430 )
    ( surface-at pallet372 place812 )
    ( surface-at crate372 place812 )
    ( on crate372 pallet372 )
    ( is-crate crate372 )
    ( clear crate372 )
    ( surface-at pallet361 place215 )
    ( surface-at crate361 place215 )
    ( on crate361 pallet361 )
    ( is-crate crate361 )
    ( clear crate361 )
    ( surface-at pallet109 place812 )
    ( surface-at crate109 place812 )
    ( on crate109 pallet109 )
    ( is-crate crate109 )
    ( clear crate109 )
    ( surface-at pallet423 place574 )
    ( surface-at crate423 place574 )
    ( on crate423 pallet423 )
    ( is-crate crate423 )
    ( clear crate423 )
  )
  ( :tasks
    ( Make-13Crate crate748 crate963 crate910 crate424 crate326 crate904 crate957 crate776 crate430 crate372 crate361 crate109 crate423 l000 )
  )
)
