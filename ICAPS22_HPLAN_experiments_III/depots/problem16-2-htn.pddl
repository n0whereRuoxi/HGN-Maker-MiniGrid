( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place753 - place
    hoist753 - hoist
    place351 - place
    hoist351 - hoist
    place814 - place
    hoist814 - hoist
    place606 - place
    hoist606 - hoist
    place577 - place
    hoist577 - hoist
    place391 - place
    hoist391 - hoist
    place81 - place
    hoist81 - hoist
    place238 - place
    hoist238 - hoist
    place610 - place
    hoist610 - hoist
    place61 - place
    hoist61 - hoist
    place535 - place
    hoist535 - hoist
    place435 - place
    hoist435 - hoist
    place844 - place
    hoist844 - hoist
    place642 - place
    hoist642 - hoist
    place152 - place
    hoist152 - hoist
    place879 - place
    hoist879 - hoist
    place359 - place
    hoist359 - hoist
    place408 - place
    hoist408 - hoist
    place537 - place
    hoist537 - hoist
    place616 - place
    hoist616 - hoist
    place643 - place
    hoist643 - hoist
    place253 - place
    hoist253 - hoist
    place213 - place
    hoist213 - hoist
    place417 - place
    hoist417 - hoist
    place88 - place
    hoist88 - hoist
    place503 - place
    hoist503 - hoist
    place0 - place
    hoist0 - hoist
    crate11 - surface
    pallet11 - surface
    crate410 - surface
    pallet410 - surface
    crate80 - surface
    pallet80 - surface
    crate480 - surface
    pallet480 - surface
    crate482 - surface
    pallet482 - surface
    crate543 - surface
    pallet543 - surface
    crate640 - surface
    pallet640 - surface
    crate622 - surface
    pallet622 - surface
    crate501 - surface
    pallet501 - surface
    crate459 - surface
    pallet459 - surface
    crate38 - surface
    pallet38 - surface
    crate17 - surface
    pallet17 - surface
    crate368 - surface
    pallet368 - surface
    crate458 - surface
    pallet458 - surface
    crate569 - surface
    pallet569 - surface
    crate494 - surface
    pallet494 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist753 place753 )
    ( available hoist753 )
    ( hoist-at hoist351 place351 )
    ( available hoist351 )
    ( hoist-at hoist814 place814 )
    ( available hoist814 )
    ( hoist-at hoist606 place606 )
    ( available hoist606 )
    ( hoist-at hoist577 place577 )
    ( available hoist577 )
    ( hoist-at hoist391 place391 )
    ( available hoist391 )
    ( hoist-at hoist81 place81 )
    ( available hoist81 )
    ( hoist-at hoist238 place238 )
    ( available hoist238 )
    ( hoist-at hoist610 place610 )
    ( available hoist610 )
    ( hoist-at hoist61 place61 )
    ( available hoist61 )
    ( hoist-at hoist535 place535 )
    ( available hoist535 )
    ( hoist-at hoist435 place435 )
    ( available hoist435 )
    ( hoist-at hoist844 place844 )
    ( available hoist844 )
    ( hoist-at hoist642 place642 )
    ( available hoist642 )
    ( hoist-at hoist152 place152 )
    ( available hoist152 )
    ( hoist-at hoist879 place879 )
    ( available hoist879 )
    ( hoist-at hoist359 place359 )
    ( available hoist359 )
    ( hoist-at hoist408 place408 )
    ( available hoist408 )
    ( hoist-at hoist537 place537 )
    ( available hoist537 )
    ( hoist-at hoist616 place616 )
    ( available hoist616 )
    ( hoist-at hoist643 place643 )
    ( available hoist643 )
    ( hoist-at hoist253 place253 )
    ( available hoist253 )
    ( hoist-at hoist213 place213 )
    ( available hoist213 )
    ( hoist-at hoist417 place417 )
    ( available hoist417 )
    ( hoist-at hoist88 place88 )
    ( available hoist88 )
    ( hoist-at hoist503 place503 )
    ( available hoist503 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet11 place253 )
    ( surface-at crate11 place253 )
    ( on crate11 pallet11 )
    ( is-crate crate11 )
    ( clear crate11 )
    ( surface-at pallet410 place351 )
    ( surface-at crate410 place351 )
    ( on crate410 pallet410 )
    ( is-crate crate410 )
    ( clear crate410 )
    ( surface-at pallet80 place577 )
    ( surface-at crate80 place577 )
    ( on crate80 pallet80 )
    ( is-crate crate80 )
    ( clear crate80 )
    ( surface-at pallet480 place88 )
    ( surface-at crate480 place88 )
    ( on crate480 pallet480 )
    ( is-crate crate480 )
    ( clear crate480 )
    ( surface-at pallet482 place577 )
    ( surface-at crate482 place577 )
    ( on crate482 pallet482 )
    ( is-crate crate482 )
    ( clear crate482 )
    ( surface-at pallet543 place610 )
    ( surface-at crate543 place610 )
    ( on crate543 pallet543 )
    ( is-crate crate543 )
    ( clear crate543 )
    ( surface-at pallet640 place408 )
    ( surface-at crate640 place408 )
    ( on crate640 pallet640 )
    ( is-crate crate640 )
    ( clear crate640 )
    ( surface-at pallet622 place616 )
    ( surface-at crate622 place616 )
    ( on crate622 pallet622 )
    ( is-crate crate622 )
    ( clear crate622 )
    ( surface-at pallet501 place61 )
    ( surface-at crate501 place61 )
    ( on crate501 pallet501 )
    ( is-crate crate501 )
    ( clear crate501 )
    ( surface-at pallet459 place435 )
    ( surface-at crate459 place435 )
    ( on crate459 pallet459 )
    ( is-crate crate459 )
    ( clear crate459 )
    ( surface-at pallet38 place213 )
    ( surface-at crate38 place213 )
    ( on crate38 pallet38 )
    ( is-crate crate38 )
    ( clear crate38 )
    ( surface-at pallet17 place359 )
    ( surface-at crate17 place359 )
    ( on crate17 pallet17 )
    ( is-crate crate17 )
    ( clear crate17 )
    ( surface-at pallet368 place814 )
    ( surface-at crate368 place814 )
    ( on crate368 pallet368 )
    ( is-crate crate368 )
    ( clear crate368 )
    ( surface-at pallet458 place879 )
    ( surface-at crate458 place879 )
    ( on crate458 pallet458 )
    ( is-crate crate458 )
    ( clear crate458 )
    ( surface-at pallet569 place844 )
    ( surface-at crate569 place844 )
    ( on crate569 pallet569 )
    ( is-crate crate569 )
    ( clear crate569 )
    ( surface-at pallet494 place359 )
    ( surface-at crate494 place359 )
    ( on crate494 pallet494 )
    ( is-crate crate494 )
    ( clear crate494 )
  )
  ( :tasks
    ( Make-16Crate crate11 crate410 crate80 crate480 crate482 crate543 crate640 crate622 crate501 crate459 crate38 crate17 crate368 crate458 crate569 crate494 l000 )
  )
)
