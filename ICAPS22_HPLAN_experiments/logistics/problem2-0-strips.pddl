( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-421 - location
    l000-243 - location
    p383 - obj
    p262 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-421 c000 )
    ( in-city l000-243 c000 )
    ( obj-at p383 l000-421 )
    ( obj-at p262 l000-421 )
  )
  ( :goal
    ( and
      ( obj-at p383 l000-000 )
      ( obj-at p262 l000-000 )
    )
  )
)
