( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-199 - location
    l000-291 - location
    l000-478 - location
    p527 - obj
    p971 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-199 c000 )
    ( in-city l000-291 c000 )
    ( in-city l000-478 c000 )
    ( obj-at p527 l000-199 )
    ( obj-at p971 l000-291 )
  )
  ( :goal
    ( and
      ( obj-at p527 l000-000 )
      ( obj-at p971 l000-000 )
    )
  )
)
