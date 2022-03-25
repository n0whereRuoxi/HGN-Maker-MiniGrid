( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-626 - location
    l000-838 - location
    l000-384 - location
    l000-426 - location
    l000-225 - location
    l000-506 - location
    l000-357 - location
    l000-367 - location
    l000-246 - location
    l000-210 - location
    l000-170 - location
    l000-885 - location
    l000-303 - location
    l000-451 - location
    l000-244 - location
    l000-545 - location
    l000-592 - location
    p98 - obj
    p482 - obj
    p549 - obj
    p385 - obj
    p212 - obj
    p436 - obj
    p244 - obj
    p492 - obj
    p647 - obj
    p421 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-626 c000 )
    ( in-city l000-838 c000 )
    ( in-city l000-384 c000 )
    ( in-city l000-426 c000 )
    ( in-city l000-225 c000 )
    ( in-city l000-506 c000 )
    ( in-city l000-357 c000 )
    ( in-city l000-367 c000 )
    ( in-city l000-246 c000 )
    ( in-city l000-210 c000 )
    ( in-city l000-170 c000 )
    ( in-city l000-885 c000 )
    ( in-city l000-303 c000 )
    ( in-city l000-451 c000 )
    ( in-city l000-244 c000 )
    ( in-city l000-545 c000 )
    ( in-city l000-592 c000 )
    ( obj-at p98 l000-244 )
    ( obj-at p482 l000-885 )
    ( obj-at p549 l000-838 )
    ( obj-at p385 l000-357 )
    ( obj-at p212 l000-225 )
    ( obj-at p436 l000-225 )
    ( obj-at p244 l000-626 )
    ( obj-at p492 l000-506 )
    ( obj-at p647 l000-451 )
    ( obj-at p421 l000-246 )
  )
  ( :goal
    ( and
      ( obj-at p98 l000-000 )
      ( obj-at p482 l000-000 )
      ( obj-at p549 l000-000 )
      ( obj-at p385 l000-000 )
      ( obj-at p212 l000-000 )
      ( obj-at p436 l000-000 )
      ( obj-at p244 l000-000 )
      ( obj-at p492 l000-000 )
      ( obj-at p647 l000-000 )
      ( obj-at p421 l000-000 )
    )
  )
)
