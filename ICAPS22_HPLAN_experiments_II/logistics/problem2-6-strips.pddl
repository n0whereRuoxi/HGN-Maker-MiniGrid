( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-20 - location
    p771 - obj
    p980 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-20 c000 )
    ( obj-at p771 l000-20 )
    ( obj-at p980 l000-20 )
  )
  ( :goal
    ( and
      ( obj-at p771 l000-000 )
      ( obj-at p980 l000-000 )
    )
  )
)
