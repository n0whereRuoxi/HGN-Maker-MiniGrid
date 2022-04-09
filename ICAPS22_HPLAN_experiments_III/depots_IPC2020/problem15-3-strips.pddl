( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place156 - place
    hoist156 - hoist
    place144 - place
    hoist144 - hoist
    place689 - place
    hoist689 - hoist
    place171 - place
    hoist171 - hoist
    place423 - place
    hoist423 - hoist
    place682 - place
    hoist682 - hoist
    place271 - place
    hoist271 - hoist
    place935 - place
    hoist935 - hoist
    place0 - place
    hoist0 - hoist
    crate63 - surface
    pallet63 - surface
    crate485 - surface
    pallet485 - surface
    crate995 - surface
    pallet995 - surface
    crate495 - surface
    pallet495 - surface
    crate342 - surface
    pallet342 - surface
    crate472 - surface
    pallet472 - surface
    crate21 - surface
    pallet21 - surface
    crate654 - surface
    pallet654 - surface
    crate608 - surface
    pallet608 - surface
    crate49 - surface
    pallet49 - surface
    crate148 - surface
    pallet148 - surface
    crate192 - surface
    pallet192 - surface
    crate808 - surface
    pallet808 - surface
    crate722 - surface
    pallet722 - surface
    crate405 - surface
    pallet405 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist156 place156 )
    ( available hoist156 )
    ( hoist-at hoist144 place144 )
    ( available hoist144 )
    ( hoist-at hoist689 place689 )
    ( available hoist689 )
    ( hoist-at hoist171 place171 )
    ( available hoist171 )
    ( hoist-at hoist423 place423 )
    ( available hoist423 )
    ( hoist-at hoist682 place682 )
    ( available hoist682 )
    ( hoist-at hoist271 place271 )
    ( available hoist271 )
    ( hoist-at hoist935 place935 )
    ( available hoist935 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet63 place171 )
    ( surface-at crate63 place171 )
    ( on crate63 pallet63 )
    ( is-crate crate63 )
    ( clear crate63 )
    ( surface-at pallet485 place171 )
    ( surface-at crate485 place171 )
    ( on crate485 pallet485 )
    ( is-crate crate485 )
    ( clear crate485 )
    ( surface-at pallet995 place156 )
    ( surface-at crate995 place156 )
    ( on crate995 pallet995 )
    ( is-crate crate995 )
    ( clear crate995 )
    ( surface-at pallet495 place935 )
    ( surface-at crate495 place935 )
    ( on crate495 pallet495 )
    ( is-crate crate495 )
    ( clear crate495 )
    ( surface-at pallet342 place935 )
    ( surface-at crate342 place935 )
    ( on crate342 pallet342 )
    ( is-crate crate342 )
    ( clear crate342 )
    ( surface-at pallet472 place689 )
    ( surface-at crate472 place689 )
    ( on crate472 pallet472 )
    ( is-crate crate472 )
    ( clear crate472 )
    ( surface-at pallet21 place144 )
    ( surface-at crate21 place144 )
    ( on crate21 pallet21 )
    ( is-crate crate21 )
    ( clear crate21 )
    ( surface-at pallet654 place171 )
    ( surface-at crate654 place171 )
    ( on crate654 pallet654 )
    ( is-crate crate654 )
    ( clear crate654 )
    ( surface-at pallet608 place423 )
    ( surface-at crate608 place423 )
    ( on crate608 pallet608 )
    ( is-crate crate608 )
    ( clear crate608 )
    ( surface-at pallet49 place156 )
    ( surface-at crate49 place156 )
    ( on crate49 pallet49 )
    ( is-crate crate49 )
    ( clear crate49 )
    ( surface-at pallet148 place271 )
    ( surface-at crate148 place271 )
    ( on crate148 pallet148 )
    ( is-crate crate148 )
    ( clear crate148 )
    ( surface-at pallet192 place171 )
    ( surface-at crate192 place171 )
    ( on crate192 pallet192 )
    ( is-crate crate192 )
    ( clear crate192 )
    ( surface-at pallet808 place682 )
    ( surface-at crate808 place682 )
    ( on crate808 pallet808 )
    ( is-crate crate808 )
    ( clear crate808 )
    ( surface-at pallet722 place423 )
    ( surface-at crate722 place423 )
    ( on crate722 pallet722 )
    ( is-crate crate722 )
    ( clear crate722 )
    ( surface-at pallet405 place682 )
    ( surface-at crate405 place682 )
    ( on crate405 pallet405 )
    ( is-crate crate405 )
    ( clear crate405 )
  )
  ( :goal
    ( and
    )
  )
)
