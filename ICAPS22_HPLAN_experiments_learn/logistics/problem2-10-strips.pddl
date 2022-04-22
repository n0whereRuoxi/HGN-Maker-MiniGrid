( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-241 - location
    p258 - obj
    p690 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-241 c000 )
    ( obj-at p258 l000-241 )
    ( obj-at p690 l000-241 )
  )
  ( :goal
    ( and
      ( obj-at p258 l000-000 )
      ( obj-at p690 l000-000 )
    )
  )
)
