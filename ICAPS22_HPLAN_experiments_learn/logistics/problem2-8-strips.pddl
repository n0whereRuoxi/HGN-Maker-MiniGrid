( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-314 - location
    l000-842 - location
    l000-13 - location
    l000-45 - location
    p29 - obj
    p494 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-314 c000 )
    ( in-city l000-842 c000 )
    ( in-city l000-13 c000 )
    ( in-city l000-45 c000 )
    ( obj-at p29 l000-842 )
    ( obj-at p494 l000-13 )
  )
  ( :goal
    ( and
      ( obj-at p29 l000-000 )
      ( obj-at p494 l000-000 )
    )
  )
)
