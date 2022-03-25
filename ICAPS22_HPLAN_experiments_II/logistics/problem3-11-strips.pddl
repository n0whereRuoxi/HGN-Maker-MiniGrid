( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-768 - location
    l000-396 - location
    l000-65 - location
    l000-129 - location
    l000-132 - location
    l000-369 - location
    p355 - obj
    p810 - obj
    p32 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-768 c000 )
    ( in-city l000-396 c000 )
    ( in-city l000-65 c000 )
    ( in-city l000-129 c000 )
    ( in-city l000-132 c000 )
    ( in-city l000-369 c000 )
    ( obj-at p355 l000-129 )
    ( obj-at p810 l000-768 )
    ( obj-at p32 l000-129 )
  )
  ( :goal
    ( and
      ( obj-at p355 l000-000 )
      ( obj-at p810 l000-000 )
      ( obj-at p32 l000-000 )
    )
  )
)
