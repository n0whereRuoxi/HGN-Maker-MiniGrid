( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-175 - location
    l000-544 - location
    l000-433 - location
    l000-131 - location
    p299 - obj
    p695 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-175 c000 )
    ( in-city l000-544 c000 )
    ( in-city l000-433 c000 )
    ( in-city l000-131 c000 )
    ( obj-at p299 l000-131 )
    ( obj-at p695 l000-544 )
  )
  ( :goal
    ( and
      ( obj-at p299 l000-000 )
      ( obj-at p695 l000-000 )
    )
  )
)
