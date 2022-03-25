( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-360 - location
    l000-133 - location
    p875 - obj
    p812 - obj
    p850 - obj
    p79 - obj
    p809 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-360 c000 )
    ( in-city l000-133 c000 )
    ( obj-at p875 l000-360 )
    ( obj-at p812 l000-360 )
    ( obj-at p850 l000-133 )
    ( obj-at p79 l000-133 )
    ( obj-at p809 l000-133 )
  )
  ( :goal
    ( and
      ( obj-at p875 l000-000 )
      ( obj-at p812 l000-000 )
      ( obj-at p850 l000-000 )
      ( obj-at p79 l000-000 )
      ( obj-at p809 l000-000 )
    )
  )
)
