( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-554 - location
    l000-859 - location
    l000-528 - location
    p707 - obj
    p806 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-554 c000 )
    ( in-city l000-859 c000 )
    ( in-city l000-528 c000 )
    ( obj-at p707 l000-859 )
    ( obj-at p806 l000-528 )
  )
  ( :goal
    ( and
      ( obj-at p707 l000-000 )
      ( obj-at p806 l000-000 )
    )
  )
)
