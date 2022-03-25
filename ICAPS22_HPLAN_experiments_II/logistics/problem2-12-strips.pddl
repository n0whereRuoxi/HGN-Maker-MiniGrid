( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-627 - location
    l000-937 - location
    l000-84 - location
    p463 - obj
    p875 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-627 c000 )
    ( in-city l000-937 c000 )
    ( in-city l000-84 c000 )
    ( obj-at p463 l000-937 )
    ( obj-at p875 l000-84 )
  )
  ( :goal
    ( and
      ( obj-at p463 l000-000 )
      ( obj-at p875 l000-000 )
    )
  )
)
