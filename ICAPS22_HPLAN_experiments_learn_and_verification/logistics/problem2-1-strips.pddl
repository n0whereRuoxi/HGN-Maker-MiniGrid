( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-979 - location
    l000-339 - location
    p630 - obj
    p23 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-979 c000 )
    ( in-city l000-339 c000 )
    ( obj-at p630 l000-339 )
    ( obj-at p23 l000-339 )
  )
  ( :goal
    ( and
      ( obj-at p630 l000-000 )
      ( obj-at p23 l000-000 )
    )
  )
)
