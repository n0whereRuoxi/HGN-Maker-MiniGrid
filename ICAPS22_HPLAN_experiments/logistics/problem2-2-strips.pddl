( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-994 - location
    p882 - obj
    p809 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-994 c000 )
    ( obj-at p882 l000-994 )
    ( obj-at p809 l000-994 )
  )
  ( :goal
    ( and
      ( obj-at p882 l000-000 )
      ( obj-at p809 l000-000 )
    )
  )
)
