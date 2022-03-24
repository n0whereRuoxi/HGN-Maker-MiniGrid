( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-349 - location
    l000-357 - location
    l000-604 - location
    l000-187 - location
    l000-304 - location
    l000-104 - location
    l000-765 - location
    l000-662 - location
    p595 - obj
    p314 - obj
    p211 - obj
    p699 - obj
    p875 - obj
    p93 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-349 c000 )
    ( in-city l000-357 c000 )
    ( in-city l000-604 c000 )
    ( in-city l000-187 c000 )
    ( in-city l000-304 c000 )
    ( in-city l000-104 c000 )
    ( in-city l000-765 c000 )
    ( in-city l000-662 c000 )
    ( obj-at p595 l000-765 )
    ( obj-at p314 l000-765 )
    ( obj-at p211 l000-104 )
    ( obj-at p699 l000-304 )
    ( obj-at p875 l000-357 )
    ( obj-at p93 l000-357 )
  )
  ( :goal
    ( and
      ( obj-at p595 l000-000 )
      ( obj-at p314 l000-000 )
      ( obj-at p211 l000-000 )
      ( obj-at p699 l000-000 )
      ( obj-at p875 l000-000 )
      ( obj-at p93 l000-000 )
    )
  )
)
