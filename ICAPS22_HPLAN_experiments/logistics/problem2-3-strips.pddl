( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-89 - location
    l000-666 - location
    p338 - obj
    p337 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-89 c000 )
    ( in-city l000-666 c000 )
    ( obj-at p338 l000-89 )
    ( obj-at p337 l000-666 )
  )
  ( :goal
    ( and
      ( obj-at p338 l000-000 )
      ( obj-at p337 l000-000 )
    )
  )
)
