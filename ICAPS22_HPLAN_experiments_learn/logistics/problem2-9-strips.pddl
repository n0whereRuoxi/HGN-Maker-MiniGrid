( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-238 - location
    p15 - obj
    p402 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-238 c000 )
    ( obj-at p15 l000-238 )
    ( obj-at p402 l000-238 )
  )
  ( :goal
    ( and
      ( obj-at p15 l000-000 )
      ( obj-at p402 l000-000 )
    )
  )
)
