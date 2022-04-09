( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place17 - place
    hoist17 - hoist
    place227 - place
    hoist227 - hoist
    place171 - place
    hoist171 - hoist
    place568 - place
    hoist568 - hoist
    place684 - place
    hoist684 - hoist
    place767 - place
    hoist767 - hoist
    place758 - place
    hoist758 - hoist
    place319 - place
    hoist319 - hoist
    place306 - place
    hoist306 - hoist
    place242 - place
    hoist242 - hoist
    place321 - place
    hoist321 - hoist
    place865 - place
    hoist865 - hoist
    place0 - place
    hoist0 - hoist
    crate871 - surface
    pallet871 - surface
    crate745 - surface
    pallet745 - surface
    crate980 - surface
    pallet980 - surface
    crate492 - surface
    pallet492 - surface
    crate695 - surface
    pallet695 - surface
    crate974 - surface
    pallet974 - surface
    crate480 - surface
    pallet480 - surface
    crate677 - surface
    pallet677 - surface
    crate945 - surface
    pallet945 - surface
    crate743 - surface
    pallet743 - surface
    crate413 - surface
    pallet413 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist17 place17 )
    ( available hoist17 )
    ( hoist-at hoist227 place227 )
    ( available hoist227 )
    ( hoist-at hoist171 place171 )
    ( available hoist171 )
    ( hoist-at hoist568 place568 )
    ( available hoist568 )
    ( hoist-at hoist684 place684 )
    ( available hoist684 )
    ( hoist-at hoist767 place767 )
    ( available hoist767 )
    ( hoist-at hoist758 place758 )
    ( available hoist758 )
    ( hoist-at hoist319 place319 )
    ( available hoist319 )
    ( hoist-at hoist306 place306 )
    ( available hoist306 )
    ( hoist-at hoist242 place242 )
    ( available hoist242 )
    ( hoist-at hoist321 place321 )
    ( available hoist321 )
    ( hoist-at hoist865 place865 )
    ( available hoist865 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet871 place568 )
    ( surface-at crate871 place568 )
    ( on crate871 pallet871 )
    ( is-crate crate871 )
    ( clear crate871 )
    ( surface-at pallet745 place684 )
    ( surface-at crate745 place684 )
    ( on crate745 pallet745 )
    ( is-crate crate745 )
    ( clear crate745 )
    ( surface-at pallet980 place242 )
    ( surface-at crate980 place242 )
    ( on crate980 pallet980 )
    ( is-crate crate980 )
    ( clear crate980 )
    ( surface-at pallet492 place758 )
    ( surface-at crate492 place758 )
    ( on crate492 pallet492 )
    ( is-crate crate492 )
    ( clear crate492 )
    ( surface-at pallet695 place306 )
    ( surface-at crate695 place306 )
    ( on crate695 pallet695 )
    ( is-crate crate695 )
    ( clear crate695 )
    ( surface-at pallet974 place321 )
    ( surface-at crate974 place321 )
    ( on crate974 pallet974 )
    ( is-crate crate974 )
    ( clear crate974 )
    ( surface-at pallet480 place242 )
    ( surface-at crate480 place242 )
    ( on crate480 pallet480 )
    ( is-crate crate480 )
    ( clear crate480 )
    ( surface-at pallet677 place684 )
    ( surface-at crate677 place684 )
    ( on crate677 pallet677 )
    ( is-crate crate677 )
    ( clear crate677 )
    ( surface-at pallet945 place767 )
    ( surface-at crate945 place767 )
    ( on crate945 pallet945 )
    ( is-crate crate945 )
    ( clear crate945 )
    ( surface-at pallet743 place568 )
    ( surface-at crate743 place568 )
    ( on crate743 pallet743 )
    ( is-crate crate743 )
    ( clear crate743 )
    ( surface-at pallet413 place227 )
    ( surface-at crate413 place227 )
    ( on crate413 pallet413 )
    ( is-crate crate413 )
    ( clear crate413 )
  )
  ( :tasks
    ( Make-11Crate pallet0 crate871 crate745 crate980 crate492 crate695 crate974 crate480 crate677 crate945 crate743 crate413 )
  )
)
