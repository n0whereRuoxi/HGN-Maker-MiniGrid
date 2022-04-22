( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-633 - location
    p841 - obj
    p319 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-633 c000 )
    ( obj-at p841 l000-633 )
    ( obj-at p319 l000-633 )
  )
  ( :goal
    ( and
      ( obj-at p841 l000-000 )
      ( obj-at p319 l000-000 )
    )
  )
)
