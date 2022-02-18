( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-765 - location
    l000-255 - location
    l000-497 - location
    p961 - obj
    p580 - obj
    p973 - obj
    p874 - obj
    p63 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-765 c000 )
    ( in-city l000-255 c000 )
    ( in-city l000-497 c000 )
    ( obj-at p961 l000-255 )
    ( obj-at p580 l000-497 )
    ( obj-at p973 l000-765 )
    ( obj-at p874 l000-497 )
    ( obj-at p63 l000-765 )
  )
  ( :goal
    ( and
      ( obj-at p961 l000-000 )
      ( obj-at p580 l000-000 )
      ( obj-at p973 l000-000 )
      ( obj-at p874 l000-000 )
      ( obj-at p63 l000-000 )
    )
  )
)
