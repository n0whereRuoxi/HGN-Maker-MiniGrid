( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-42 - location
    l000-269 - location
    l000-306 - location
    p409 - obj
    p481 - obj
    p983 - obj
    p512 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-42 c000 )
    ( in-city l000-269 c000 )
    ( in-city l000-306 c000 )
    ( obj-at p409 l000-42 )
    ( obj-at p481 l000-42 )
    ( obj-at p983 l000-306 )
    ( obj-at p512 l000-42 )
  )
  ( :goal
    ( and
      ( obj-at p409 l000-000 )
      ( obj-at p481 l000-000 )
      ( obj-at p983 l000-000 )
      ( obj-at p512 l000-000 )
    )
  )
)
