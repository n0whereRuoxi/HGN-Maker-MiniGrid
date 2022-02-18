( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-354 - location
    l000-441 - location
    p634 - obj
    p933 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-354 c000 )
    ( in-city l000-441 c000 )
    ( obj-at p634 l000-354 )
    ( obj-at p933 l000-441 )
  )
  ( :goal
    ( and
      ( obj-at p634 l000-000 )
      ( obj-at p933 l000-000 )
    )
  )
)
