( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place299 - place
    hoist299 - hoist
    place53 - place
    hoist53 - hoist
    place282 - place
    hoist282 - hoist
    place559 - place
    hoist559 - hoist
    place767 - place
    hoist767 - hoist
    place829 - place
    hoist829 - hoist
    place275 - place
    hoist275 - hoist
    place363 - place
    hoist363 - hoist
    place774 - place
    hoist774 - hoist
    place272 - place
    hoist272 - hoist
    place470 - place
    hoist470 - hoist
    place0 - place
    hoist0 - hoist
    crate985 - surface
    pallet985 - surface
    crate809 - surface
    pallet809 - surface
    crate911 - surface
    pallet911 - surface
    crate830 - surface
    pallet830 - surface
    crate714 - surface
    pallet714 - surface
    crate439 - surface
    pallet439 - surface
    crate679 - surface
    pallet679 - surface
    crate323 - surface
    pallet323 - surface
    crate211 - surface
    pallet211 - surface
    crate884 - surface
    pallet884 - surface
    crate299 - surface
    pallet299 - surface
    crate432 - surface
    pallet432 - surface
    crate430 - surface
    pallet430 - surface
    crate572 - surface
    pallet572 - surface
    crate139 - surface
    pallet139 - surface
    crate403 - surface
    pallet403 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist299 place299 )
    ( available hoist299 )
    ( hoist-at hoist53 place53 )
    ( available hoist53 )
    ( hoist-at hoist282 place282 )
    ( available hoist282 )
    ( hoist-at hoist559 place559 )
    ( available hoist559 )
    ( hoist-at hoist767 place767 )
    ( available hoist767 )
    ( hoist-at hoist829 place829 )
    ( available hoist829 )
    ( hoist-at hoist275 place275 )
    ( available hoist275 )
    ( hoist-at hoist363 place363 )
    ( available hoist363 )
    ( hoist-at hoist774 place774 )
    ( available hoist774 )
    ( hoist-at hoist272 place272 )
    ( available hoist272 )
    ( hoist-at hoist470 place470 )
    ( available hoist470 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet985 place299 )
    ( surface-at crate985 place299 )
    ( on crate985 pallet985 )
    ( is-crate crate985 )
    ( clear crate985 )
    ( surface-at pallet809 place767 )
    ( surface-at crate809 place767 )
    ( on crate809 pallet809 )
    ( is-crate crate809 )
    ( clear crate809 )
    ( surface-at pallet911 place272 )
    ( surface-at crate911 place272 )
    ( on crate911 pallet911 )
    ( is-crate crate911 )
    ( clear crate911 )
    ( surface-at pallet830 place829 )
    ( surface-at crate830 place829 )
    ( on crate830 pallet830 )
    ( is-crate crate830 )
    ( clear crate830 )
    ( surface-at pallet714 place559 )
    ( surface-at crate714 place559 )
    ( on crate714 pallet714 )
    ( is-crate crate714 )
    ( clear crate714 )
    ( surface-at pallet439 place272 )
    ( surface-at crate439 place272 )
    ( on crate439 pallet439 )
    ( is-crate crate439 )
    ( clear crate439 )
    ( surface-at pallet679 place53 )
    ( surface-at crate679 place53 )
    ( on crate679 pallet679 )
    ( is-crate crate679 )
    ( clear crate679 )
    ( surface-at pallet323 place53 )
    ( surface-at crate323 place53 )
    ( on crate323 pallet323 )
    ( is-crate crate323 )
    ( clear crate323 )
    ( surface-at pallet211 place299 )
    ( surface-at crate211 place299 )
    ( on crate211 pallet211 )
    ( is-crate crate211 )
    ( clear crate211 )
    ( surface-at pallet884 place282 )
    ( surface-at crate884 place282 )
    ( on crate884 pallet884 )
    ( is-crate crate884 )
    ( clear crate884 )
    ( surface-at pallet299 place275 )
    ( surface-at crate299 place275 )
    ( on crate299 pallet299 )
    ( is-crate crate299 )
    ( clear crate299 )
    ( surface-at pallet432 place282 )
    ( surface-at crate432 place282 )
    ( on crate432 pallet432 )
    ( is-crate crate432 )
    ( clear crate432 )
    ( surface-at pallet430 place559 )
    ( surface-at crate430 place559 )
    ( on crate430 pallet430 )
    ( is-crate crate430 )
    ( clear crate430 )
    ( surface-at pallet572 place53 )
    ( surface-at crate572 place53 )
    ( on crate572 pallet572 )
    ( is-crate crate572 )
    ( clear crate572 )
    ( surface-at pallet139 place559 )
    ( surface-at crate139 place559 )
    ( on crate139 pallet139 )
    ( is-crate crate139 )
    ( clear crate139 )
    ( surface-at pallet403 place774 )
    ( surface-at crate403 place774 )
    ( on crate403 pallet403 )
    ( is-crate crate403 )
    ( clear crate403 )
  )
  ( :goal
    ( and
    )
  )
)
