( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-153 - location
    l000-245 - location
    p70 - obj
    p553 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-153 c000 )
    ( in-city l000-245 c000 )
    ( obj-at p70 l000-245 )
    ( obj-at p553 l000-153 )
  )
  ( :goal
    ( and
      ( obj-at p70 l000-000 )
      ( obj-at p553 l000-000 )
    )
  )
)
