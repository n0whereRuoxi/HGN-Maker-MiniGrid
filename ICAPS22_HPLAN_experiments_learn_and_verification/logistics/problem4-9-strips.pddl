( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-916 - location
    l000-292 - location
    l000-436 - location
    l000-650 - location
    l000-47 - location
    l000-864 - location
    l000-53 - location
    l000-945 - location
    p385 - obj
    p421 - obj
    p123 - obj
    p359 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-916 c000 )
    ( in-city l000-292 c000 )
    ( in-city l000-436 c000 )
    ( in-city l000-650 c000 )
    ( in-city l000-47 c000 )
    ( in-city l000-864 c000 )
    ( in-city l000-53 c000 )
    ( in-city l000-945 c000 )
    ( obj-at p385 l000-916 )
    ( obj-at p421 l000-53 )
    ( obj-at p123 l000-945 )
    ( obj-at p359 l000-47 )
  )
  ( :goal
    ( and
      ( obj-at p385 l000-000 )
      ( obj-at p421 l000-000 )
      ( obj-at p123 l000-000 )
      ( obj-at p359 l000-000 )
    )
  )
)
