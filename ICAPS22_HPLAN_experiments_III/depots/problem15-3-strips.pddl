( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place135 - place
    hoist135 - hoist
    place711 - place
    hoist711 - hoist
    place775 - place
    hoist775 - hoist
    place435 - place
    hoist435 - hoist
    place693 - place
    hoist693 - hoist
    place589 - place
    hoist589 - hoist
    place732 - place
    hoist732 - hoist
    place554 - place
    hoist554 - hoist
    place714 - place
    hoist714 - hoist
    place455 - place
    hoist455 - hoist
    place104 - place
    hoist104 - hoist
    place132 - place
    hoist132 - hoist
    place105 - place
    hoist105 - hoist
    place185 - place
    hoist185 - hoist
    place200 - place
    hoist200 - hoist
    place76 - place
    hoist76 - hoist
    place7 - place
    hoist7 - hoist
    place915 - place
    hoist915 - hoist
    place663 - place
    hoist663 - hoist
    place681 - place
    hoist681 - hoist
    place708 - place
    hoist708 - hoist
    place777 - place
    hoist777 - hoist
    place671 - place
    hoist671 - hoist
    place262 - place
    hoist262 - hoist
    place921 - place
    hoist921 - hoist
    place11 - place
    hoist11 - hoist
    place56 - place
    hoist56 - hoist
    place0 - place
    hoist0 - hoist
    crate107 - surface
    pallet107 - surface
    crate357 - surface
    pallet357 - surface
    crate853 - surface
    pallet853 - surface
    crate394 - surface
    pallet394 - surface
    crate8 - surface
    pallet8 - surface
    crate657 - surface
    pallet657 - surface
    crate505 - surface
    pallet505 - surface
    crate959 - surface
    pallet959 - surface
    crate664 - surface
    pallet664 - surface
    crate218 - surface
    pallet218 - surface
    crate398 - surface
    pallet398 - surface
    crate488 - surface
    pallet488 - surface
    crate458 - surface
    pallet458 - surface
    crate346 - surface
    pallet346 - surface
    crate980 - surface
    pallet980 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist135 place135 )
    ( available hoist135 )
    ( hoist-at hoist711 place711 )
    ( available hoist711 )
    ( hoist-at hoist775 place775 )
    ( available hoist775 )
    ( hoist-at hoist435 place435 )
    ( available hoist435 )
    ( hoist-at hoist693 place693 )
    ( available hoist693 )
    ( hoist-at hoist589 place589 )
    ( available hoist589 )
    ( hoist-at hoist732 place732 )
    ( available hoist732 )
    ( hoist-at hoist554 place554 )
    ( available hoist554 )
    ( hoist-at hoist714 place714 )
    ( available hoist714 )
    ( hoist-at hoist455 place455 )
    ( available hoist455 )
    ( hoist-at hoist104 place104 )
    ( available hoist104 )
    ( hoist-at hoist132 place132 )
    ( available hoist132 )
    ( hoist-at hoist105 place105 )
    ( available hoist105 )
    ( hoist-at hoist185 place185 )
    ( available hoist185 )
    ( hoist-at hoist200 place200 )
    ( available hoist200 )
    ( hoist-at hoist76 place76 )
    ( available hoist76 )
    ( hoist-at hoist7 place7 )
    ( available hoist7 )
    ( hoist-at hoist915 place915 )
    ( available hoist915 )
    ( hoist-at hoist663 place663 )
    ( available hoist663 )
    ( hoist-at hoist681 place681 )
    ( available hoist681 )
    ( hoist-at hoist708 place708 )
    ( available hoist708 )
    ( hoist-at hoist777 place777 )
    ( available hoist777 )
    ( hoist-at hoist671 place671 )
    ( available hoist671 )
    ( hoist-at hoist262 place262 )
    ( available hoist262 )
    ( hoist-at hoist921 place921 )
    ( available hoist921 )
    ( hoist-at hoist11 place11 )
    ( available hoist11 )
    ( hoist-at hoist56 place56 )
    ( available hoist56 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet107 place185 )
    ( surface-at crate107 place185 )
    ( on crate107 pallet107 )
    ( is-crate crate107 )
    ( clear crate107 )
    ( surface-at pallet357 place714 )
    ( surface-at crate357 place714 )
    ( on crate357 pallet357 )
    ( is-crate crate357 )
    ( clear crate357 )
    ( surface-at pallet853 place775 )
    ( surface-at crate853 place775 )
    ( on crate853 pallet853 )
    ( is-crate crate853 )
    ( clear crate853 )
    ( surface-at pallet394 place200 )
    ( surface-at crate394 place200 )
    ( on crate394 pallet394 )
    ( is-crate crate394 )
    ( clear crate394 )
    ( surface-at pallet8 place11 )
    ( surface-at crate8 place11 )
    ( on crate8 pallet8 )
    ( is-crate crate8 )
    ( clear crate8 )
    ( surface-at pallet657 place708 )
    ( surface-at crate657 place708 )
    ( on crate657 pallet657 )
    ( is-crate crate657 )
    ( clear crate657 )
    ( surface-at pallet505 place671 )
    ( surface-at crate505 place671 )
    ( on crate505 pallet505 )
    ( is-crate crate505 )
    ( clear crate505 )
    ( surface-at pallet959 place200 )
    ( surface-at crate959 place200 )
    ( on crate959 pallet959 )
    ( is-crate crate959 )
    ( clear crate959 )
    ( surface-at pallet664 place262 )
    ( surface-at crate664 place262 )
    ( on crate664 pallet664 )
    ( is-crate crate664 )
    ( clear crate664 )
    ( surface-at pallet218 place200 )
    ( surface-at crate218 place200 )
    ( on crate218 pallet218 )
    ( is-crate crate218 )
    ( clear crate218 )
    ( surface-at pallet398 place915 )
    ( surface-at crate398 place915 )
    ( on crate398 pallet398 )
    ( is-crate crate398 )
    ( clear crate398 )
    ( surface-at pallet488 place714 )
    ( surface-at crate488 place714 )
    ( on crate488 pallet488 )
    ( is-crate crate488 )
    ( clear crate488 )
    ( surface-at pallet458 place589 )
    ( surface-at crate458 place589 )
    ( on crate458 pallet458 )
    ( is-crate crate458 )
    ( clear crate458 )
    ( surface-at pallet346 place455 )
    ( surface-at crate346 place455 )
    ( on crate346 pallet346 )
    ( is-crate crate346 )
    ( clear crate346 )
    ( surface-at pallet980 place455 )
    ( surface-at crate980 place455 )
    ( on crate980 pallet980 )
    ( is-crate crate980 )
    ( clear crate980 )
  )
  ( :goal
    ( and
    )
  )
)
