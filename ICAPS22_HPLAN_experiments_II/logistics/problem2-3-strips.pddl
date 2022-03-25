( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-388 - location
    p799 - obj
    p389 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-388 c000 )
    ( obj-at p799 l000-388 )
    ( obj-at p389 l000-388 )
  )
  ( :goal
    ( and
      ( obj-at p799 l000-000 )
      ( obj-at p389 l000-000 )
    )
  )
)
