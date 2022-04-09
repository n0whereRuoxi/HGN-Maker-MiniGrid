( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place577 - place
    hoist577 - hoist
    place978 - place
    hoist978 - hoist
    place399 - place
    hoist399 - hoist
    place453 - place
    hoist453 - hoist
    place660 - place
    hoist660 - hoist
    place447 - place
    hoist447 - hoist
    place521 - place
    hoist521 - hoist
    place2 - place
    hoist2 - hoist
    place990 - place
    hoist990 - hoist
    place721 - place
    hoist721 - hoist
    place106 - place
    hoist106 - hoist
    place695 - place
    hoist695 - hoist
    place942 - place
    hoist942 - hoist
    place496 - place
    hoist496 - hoist
    place587 - place
    hoist587 - hoist
    place371 - place
    hoist371 - hoist
    place989 - place
    hoist989 - hoist
    place440 - place
    hoist440 - hoist
    place823 - place
    hoist823 - hoist
    place422 - place
    hoist422 - hoist
    place0 - place
    hoist0 - hoist
    crate89 - surface
    pallet89 - surface
    crate39 - surface
    pallet39 - surface
    crate508 - surface
    pallet508 - surface
    crate677 - surface
    pallet677 - surface
    crate903 - surface
    pallet903 - surface
    crate263 - surface
    pallet263 - surface
    crate147 - surface
    pallet147 - surface
    crate852 - surface
    pallet852 - surface
    crate244 - surface
    pallet244 - surface
    crate822 - surface
    pallet822 - surface
    crate446 - surface
    pallet446 - surface
    crate270 - surface
    pallet270 - surface
    crate799 - surface
    pallet799 - surface
    crate617 - surface
    pallet617 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist577 place577 )
    ( available hoist577 )
    ( hoist-at hoist978 place978 )
    ( available hoist978 )
    ( hoist-at hoist399 place399 )
    ( available hoist399 )
    ( hoist-at hoist453 place453 )
    ( available hoist453 )
    ( hoist-at hoist660 place660 )
    ( available hoist660 )
    ( hoist-at hoist447 place447 )
    ( available hoist447 )
    ( hoist-at hoist521 place521 )
    ( available hoist521 )
    ( hoist-at hoist2 place2 )
    ( available hoist2 )
    ( hoist-at hoist990 place990 )
    ( available hoist990 )
    ( hoist-at hoist721 place721 )
    ( available hoist721 )
    ( hoist-at hoist106 place106 )
    ( available hoist106 )
    ( hoist-at hoist695 place695 )
    ( available hoist695 )
    ( hoist-at hoist942 place942 )
    ( available hoist942 )
    ( hoist-at hoist496 place496 )
    ( available hoist496 )
    ( hoist-at hoist587 place587 )
    ( available hoist587 )
    ( hoist-at hoist371 place371 )
    ( available hoist371 )
    ( hoist-at hoist989 place989 )
    ( available hoist989 )
    ( hoist-at hoist440 place440 )
    ( available hoist440 )
    ( hoist-at hoist823 place823 )
    ( available hoist823 )
    ( hoist-at hoist422 place422 )
    ( available hoist422 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet89 place990 )
    ( surface-at crate89 place990 )
    ( on crate89 pallet89 )
    ( is-crate crate89 )
    ( clear crate89 )
    ( surface-at pallet39 place978 )
    ( surface-at crate39 place978 )
    ( on crate39 pallet39 )
    ( is-crate crate39 )
    ( clear crate39 )
    ( surface-at pallet508 place422 )
    ( surface-at crate508 place422 )
    ( on crate508 pallet508 )
    ( is-crate crate508 )
    ( clear crate508 )
    ( surface-at pallet677 place496 )
    ( surface-at crate677 place496 )
    ( on crate677 pallet677 )
    ( is-crate crate677 )
    ( clear crate677 )
    ( surface-at pallet903 place721 )
    ( surface-at crate903 place721 )
    ( on crate903 pallet903 )
    ( is-crate crate903 )
    ( clear crate903 )
    ( surface-at pallet263 place521 )
    ( surface-at crate263 place521 )
    ( on crate263 pallet263 )
    ( is-crate crate263 )
    ( clear crate263 )
    ( surface-at pallet147 place371 )
    ( surface-at crate147 place371 )
    ( on crate147 pallet147 )
    ( is-crate crate147 )
    ( clear crate147 )
    ( surface-at pallet852 place371 )
    ( surface-at crate852 place371 )
    ( on crate852 pallet852 )
    ( is-crate crate852 )
    ( clear crate852 )
    ( surface-at pallet244 place587 )
    ( surface-at crate244 place587 )
    ( on crate244 pallet244 )
    ( is-crate crate244 )
    ( clear crate244 )
    ( surface-at pallet822 place453 )
    ( surface-at crate822 place453 )
    ( on crate822 pallet822 )
    ( is-crate crate822 )
    ( clear crate822 )
    ( surface-at pallet446 place422 )
    ( surface-at crate446 place422 )
    ( on crate446 pallet446 )
    ( is-crate crate446 )
    ( clear crate446 )
    ( surface-at pallet270 place440 )
    ( surface-at crate270 place440 )
    ( on crate270 pallet270 )
    ( is-crate crate270 )
    ( clear crate270 )
    ( surface-at pallet799 place440 )
    ( surface-at crate799 place440 )
    ( on crate799 pallet799 )
    ( is-crate crate799 )
    ( clear crate799 )
    ( surface-at pallet617 place2 )
    ( surface-at crate617 place2 )
    ( on crate617 pallet617 )
    ( is-crate crate617 )
    ( clear crate617 )
  )
  ( :goal
    ( and
    )
  )
)
