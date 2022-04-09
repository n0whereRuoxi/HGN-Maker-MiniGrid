( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place706 - place
    hoist706 - hoist
    place868 - place
    hoist868 - hoist
    place974 - place
    hoist974 - hoist
    place434 - place
    hoist434 - hoist
    place778 - place
    hoist778 - hoist
    place111 - place
    hoist111 - hoist
    place216 - place
    hoist216 - hoist
    place50 - place
    hoist50 - hoist
    place79 - place
    hoist79 - hoist
    place453 - place
    hoist453 - hoist
    place624 - place
    hoist624 - hoist
    place522 - place
    hoist522 - hoist
    place662 - place
    hoist662 - hoist
    place29 - place
    hoist29 - hoist
    place415 - place
    hoist415 - hoist
    place935 - place
    hoist935 - hoist
    place0 - place
    hoist0 - hoist
    crate438 - surface
    pallet438 - surface
    crate992 - surface
    pallet992 - surface
    crate873 - surface
    pallet873 - surface
    crate920 - surface
    pallet920 - surface
    crate395 - surface
    pallet395 - surface
    crate509 - surface
    pallet509 - surface
    crate945 - surface
    pallet945 - surface
    crate29 - surface
    pallet29 - surface
    crate174 - surface
    pallet174 - surface
    crate695 - surface
    pallet695 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist706 place706 )
    ( available hoist706 )
    ( hoist-at hoist868 place868 )
    ( available hoist868 )
    ( hoist-at hoist974 place974 )
    ( available hoist974 )
    ( hoist-at hoist434 place434 )
    ( available hoist434 )
    ( hoist-at hoist778 place778 )
    ( available hoist778 )
    ( hoist-at hoist111 place111 )
    ( available hoist111 )
    ( hoist-at hoist216 place216 )
    ( available hoist216 )
    ( hoist-at hoist50 place50 )
    ( available hoist50 )
    ( hoist-at hoist79 place79 )
    ( available hoist79 )
    ( hoist-at hoist453 place453 )
    ( available hoist453 )
    ( hoist-at hoist624 place624 )
    ( available hoist624 )
    ( hoist-at hoist522 place522 )
    ( available hoist522 )
    ( hoist-at hoist662 place662 )
    ( available hoist662 )
    ( hoist-at hoist29 place29 )
    ( available hoist29 )
    ( hoist-at hoist415 place415 )
    ( available hoist415 )
    ( hoist-at hoist935 place935 )
    ( available hoist935 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet438 place50 )
    ( surface-at crate438 place50 )
    ( on crate438 pallet438 )
    ( is-crate crate438 )
    ( clear crate438 )
    ( surface-at pallet992 place29 )
    ( surface-at crate992 place29 )
    ( on crate992 pallet992 )
    ( is-crate crate992 )
    ( clear crate992 )
    ( surface-at pallet873 place434 )
    ( surface-at crate873 place434 )
    ( on crate873 pallet873 )
    ( is-crate crate873 )
    ( clear crate873 )
    ( surface-at pallet920 place974 )
    ( surface-at crate920 place974 )
    ( on crate920 pallet920 )
    ( is-crate crate920 )
    ( clear crate920 )
    ( surface-at pallet395 place79 )
    ( surface-at crate395 place79 )
    ( on crate395 pallet395 )
    ( is-crate crate395 )
    ( clear crate395 )
    ( surface-at pallet509 place522 )
    ( surface-at crate509 place522 )
    ( on crate509 pallet509 )
    ( is-crate crate509 )
    ( clear crate509 )
    ( surface-at pallet945 place453 )
    ( surface-at crate945 place453 )
    ( on crate945 pallet945 )
    ( is-crate crate945 )
    ( clear crate945 )
    ( surface-at pallet29 place434 )
    ( surface-at crate29 place434 )
    ( on crate29 pallet29 )
    ( is-crate crate29 )
    ( clear crate29 )
    ( surface-at pallet174 place111 )
    ( surface-at crate174 place111 )
    ( on crate174 pallet174 )
    ( is-crate crate174 )
    ( clear crate174 )
    ( surface-at pallet695 place778 )
    ( surface-at crate695 place778 )
    ( on crate695 pallet695 )
    ( is-crate crate695 )
    ( clear crate695 )
  )
  ( :tasks
    ( Make-10Crate pallet0 crate438 crate992 crate873 crate920 crate395 crate509 crate945 crate29 crate174 crate695 )
  )
)
