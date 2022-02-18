( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-279 - location
    l000-59 - location
    p279 - obj
    p279 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-279 c000 )
    ( in-city l000-59 c000 )
    ( obj-at p279 l000-279 )
    ( obj-at p279 l000-279 )
  )
  ( :goal
    ( and
      ( obj-at p279 l000-000 )
      ( obj-at p279 l000-000 )
    )
  )
)
