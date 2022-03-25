( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-456 - location
    l000-356 - location
    p455 - obj
    p442 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-456 c000 )
    ( in-city l000-356 c000 )
    ( obj-at p455 l000-456 )
    ( obj-at p442 l000-356 )
  )
  ( :goal
    ( and
      ( obj-at p455 l000-000 )
      ( obj-at p442 l000-000 )
    )
  )
)
