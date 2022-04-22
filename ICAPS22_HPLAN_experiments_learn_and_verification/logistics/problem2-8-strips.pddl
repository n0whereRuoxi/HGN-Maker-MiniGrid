( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-45 - location
    p558 - obj
    p672 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-45 c000 )
    ( obj-at p558 l000-45 )
    ( obj-at p672 l000-45 )
  )
  ( :goal
    ( and
      ( obj-at p558 l000-000 )
      ( obj-at p672 l000-000 )
    )
  )
)
