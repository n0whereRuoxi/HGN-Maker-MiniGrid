( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-543 - location
    l000-80 - location
    p921 - obj
    p489 - obj
    p432 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-543 c000 )
    ( in-city l000-80 c000 )
    ( obj-at p921 l000-543 )
    ( obj-at p489 l000-543 )
    ( obj-at p432 l000-80 )
  )
  ( :goal
    ( and
      ( obj-at p921 l000-000 )
      ( obj-at p489 l000-000 )
      ( obj-at p432 l000-000 )
    )
  )
)
