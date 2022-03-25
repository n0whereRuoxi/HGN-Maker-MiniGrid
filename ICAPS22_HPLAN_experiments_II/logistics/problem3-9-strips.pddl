( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-706 - location
    l000-89 - location
    l000-667 - location
    l000-963 - location
    l000-616 - location
    l000-412 - location
    p958 - obj
    p233 - obj
    p484 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-706 c000 )
    ( in-city l000-89 c000 )
    ( in-city l000-667 c000 )
    ( in-city l000-963 c000 )
    ( in-city l000-616 c000 )
    ( in-city l000-412 c000 )
    ( obj-at p958 l000-616 )
    ( obj-at p233 l000-616 )
    ( obj-at p484 l000-963 )
  )
  ( :goal
    ( and
      ( obj-at p958 l000-000 )
      ( obj-at p233 l000-000 )
      ( obj-at p484 l000-000 )
    )
  )
)
