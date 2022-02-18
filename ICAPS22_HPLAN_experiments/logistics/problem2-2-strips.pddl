( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-494 - location
    l000-701 - location
    p586 - obj
    p841 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-494 c000 )
    ( in-city l000-701 c000 )
    ( obj-at p586 l000-701 )
    ( obj-at p841 l000-494 )
  )
  ( :goal
    ( and
      ( obj-at p586 l000-000 )
      ( obj-at p841 l000-000 )
    )
  )
)
