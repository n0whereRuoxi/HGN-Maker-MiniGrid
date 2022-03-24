( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-427 - location
    l000-102 - location
    l000-367 - location
    l000-42 - location
    l000-900 - location
    l000-765 - location
    l000-767 - location
    l000-423 - location
    l000-137 - location
    l000-123 - location
    l000-963 - location
    p492 - obj
    p985 - obj
    p600 - obj
    p461 - obj
    p337 - obj
    p636 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-427 c000 )
    ( in-city l000-102 c000 )
    ( in-city l000-367 c000 )
    ( in-city l000-42 c000 )
    ( in-city l000-900 c000 )
    ( in-city l000-765 c000 )
    ( in-city l000-767 c000 )
    ( in-city l000-423 c000 )
    ( in-city l000-137 c000 )
    ( in-city l000-123 c000 )
    ( in-city l000-963 c000 )
    ( obj-at p492 l000-423 )
    ( obj-at p985 l000-42 )
    ( obj-at p600 l000-367 )
    ( obj-at p461 l000-765 )
    ( obj-at p337 l000-42 )
    ( obj-at p636 l000-423 )
  )
  ( :goal
    ( and
      ( obj-at p492 l000-000 )
      ( obj-at p985 l000-000 )
      ( obj-at p600 l000-000 )
      ( obj-at p461 l000-000 )
      ( obj-at p337 l000-000 )
      ( obj-at p636 l000-000 )
    )
  )
)
