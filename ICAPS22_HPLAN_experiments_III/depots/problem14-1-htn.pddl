( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place255 - place
    hoist255 - hoist
    place990 - place
    hoist990 - hoist
    place936 - place
    hoist936 - hoist
    place653 - place
    hoist653 - hoist
    place449 - place
    hoist449 - hoist
    place764 - place
    hoist764 - hoist
    place232 - place
    hoist232 - hoist
    place100 - place
    hoist100 - hoist
    place49 - place
    hoist49 - hoist
    place770 - place
    hoist770 - hoist
    place657 - place
    hoist657 - hoist
    place311 - place
    hoist311 - hoist
    place457 - place
    hoist457 - hoist
    place30 - place
    hoist30 - hoist
    place524 - place
    hoist524 - hoist
    place820 - place
    hoist820 - hoist
    place47 - place
    hoist47 - hoist
    place458 - place
    hoist458 - hoist
    place84 - place
    hoist84 - hoist
    place849 - place
    hoist849 - hoist
    place310 - place
    hoist310 - hoist
    place460 - place
    hoist460 - hoist
    place342 - place
    hoist342 - hoist
    place2 - place
    hoist2 - hoist
    place48 - place
    hoist48 - hoist
    place811 - place
    hoist811 - hoist
    place0 - place
    hoist0 - hoist
    crate69 - surface
    pallet69 - surface
    crate238 - surface
    pallet238 - surface
    crate515 - surface
    pallet515 - surface
    crate265 - surface
    pallet265 - surface
    crate305 - surface
    pallet305 - surface
    crate655 - surface
    pallet655 - surface
    crate143 - surface
    pallet143 - surface
    crate523 - surface
    pallet523 - surface
    crate601 - surface
    pallet601 - surface
    crate650 - surface
    pallet650 - surface
    crate651 - surface
    pallet651 - surface
    crate971 - surface
    pallet971 - surface
    crate996 - surface
    pallet996 - surface
    crate814 - surface
    pallet814 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist255 place255 )
    ( available hoist255 )
    ( hoist-at hoist990 place990 )
    ( available hoist990 )
    ( hoist-at hoist936 place936 )
    ( available hoist936 )
    ( hoist-at hoist653 place653 )
    ( available hoist653 )
    ( hoist-at hoist449 place449 )
    ( available hoist449 )
    ( hoist-at hoist764 place764 )
    ( available hoist764 )
    ( hoist-at hoist232 place232 )
    ( available hoist232 )
    ( hoist-at hoist100 place100 )
    ( available hoist100 )
    ( hoist-at hoist49 place49 )
    ( available hoist49 )
    ( hoist-at hoist770 place770 )
    ( available hoist770 )
    ( hoist-at hoist657 place657 )
    ( available hoist657 )
    ( hoist-at hoist311 place311 )
    ( available hoist311 )
    ( hoist-at hoist457 place457 )
    ( available hoist457 )
    ( hoist-at hoist30 place30 )
    ( available hoist30 )
    ( hoist-at hoist524 place524 )
    ( available hoist524 )
    ( hoist-at hoist820 place820 )
    ( available hoist820 )
    ( hoist-at hoist47 place47 )
    ( available hoist47 )
    ( hoist-at hoist458 place458 )
    ( available hoist458 )
    ( hoist-at hoist84 place84 )
    ( available hoist84 )
    ( hoist-at hoist849 place849 )
    ( available hoist849 )
    ( hoist-at hoist310 place310 )
    ( available hoist310 )
    ( hoist-at hoist460 place460 )
    ( available hoist460 )
    ( hoist-at hoist342 place342 )
    ( available hoist342 )
    ( hoist-at hoist2 place2 )
    ( available hoist2 )
    ( hoist-at hoist48 place48 )
    ( available hoist48 )
    ( hoist-at hoist811 place811 )
    ( available hoist811 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet69 place2 )
    ( surface-at crate69 place2 )
    ( on crate69 pallet69 )
    ( is-crate crate69 )
    ( clear crate69 )
    ( surface-at pallet238 place47 )
    ( surface-at crate238 place47 )
    ( on crate238 pallet238 )
    ( is-crate crate238 )
    ( clear crate238 )
    ( surface-at pallet515 place311 )
    ( surface-at crate515 place311 )
    ( on crate515 pallet515 )
    ( is-crate crate515 )
    ( clear crate515 )
    ( surface-at pallet265 place990 )
    ( surface-at crate265 place990 )
    ( on crate265 pallet265 )
    ( is-crate crate265 )
    ( clear crate265 )
    ( surface-at pallet305 place47 )
    ( surface-at crate305 place47 )
    ( on crate305 pallet305 )
    ( is-crate crate305 )
    ( clear crate305 )
    ( surface-at pallet655 place449 )
    ( surface-at crate655 place449 )
    ( on crate655 pallet655 )
    ( is-crate crate655 )
    ( clear crate655 )
    ( surface-at pallet143 place255 )
    ( surface-at crate143 place255 )
    ( on crate143 pallet143 )
    ( is-crate crate143 )
    ( clear crate143 )
    ( surface-at pallet523 place460 )
    ( surface-at crate523 place460 )
    ( on crate523 pallet523 )
    ( is-crate crate523 )
    ( clear crate523 )
    ( surface-at pallet601 place764 )
    ( surface-at crate601 place764 )
    ( on crate601 pallet601 )
    ( is-crate crate601 )
    ( clear crate601 )
    ( surface-at pallet650 place232 )
    ( surface-at crate650 place232 )
    ( on crate650 pallet650 )
    ( is-crate crate650 )
    ( clear crate650 )
    ( surface-at pallet651 place458 )
    ( surface-at crate651 place458 )
    ( on crate651 pallet651 )
    ( is-crate crate651 )
    ( clear crate651 )
    ( surface-at pallet971 place770 )
    ( surface-at crate971 place770 )
    ( on crate971 pallet971 )
    ( is-crate crate971 )
    ( clear crate971 )
    ( surface-at pallet996 place2 )
    ( surface-at crate996 place2 )
    ( on crate996 pallet996 )
    ( is-crate crate996 )
    ( clear crate996 )
    ( surface-at pallet814 place100 )
    ( surface-at crate814 place100 )
    ( on crate814 pallet814 )
    ( is-crate crate814 )
    ( clear crate814 )
  )
  ( :tasks
    ( Make-14Crate pallet0 crate69 crate238 crate515 crate265 crate305 crate655 crate143 crate523 crate601 crate650 crate651 crate971 crate996 crate814 )
  )
)
