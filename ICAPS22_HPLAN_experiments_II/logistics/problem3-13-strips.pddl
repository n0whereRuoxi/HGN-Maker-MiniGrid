( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-146 - location
    l000-80 - location
    l000-528 - location
    p810 - obj
    p739 - obj
    p597 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-146 c000 )
    ( in-city l000-80 c000 )
    ( in-city l000-528 c000 )
    ( obj-at p810 l000-528 )
    ( obj-at p739 l000-146 )
    ( obj-at p597 l000-528 )
  )
  ( :goal
    ( and
      ( obj-at p810 l000-000 )
      ( obj-at p739 l000-000 )
      ( obj-at p597 l000-000 )
    )
  )
)
