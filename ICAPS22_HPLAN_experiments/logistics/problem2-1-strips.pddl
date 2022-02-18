( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-620 - location
    l000-330 - location
    l000-881 - location
    l000-662 - location
    p733 - obj
    p351 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-620 c000 )
    ( in-city l000-330 c000 )
    ( in-city l000-881 c000 )
    ( in-city l000-662 c000 )
    ( obj-at p733 l000-330 )
    ( obj-at p351 l000-330 )
  )
  ( :goal
    ( and
      ( obj-at p733 l000-000 )
      ( obj-at p351 l000-000 )
    )
  )
)
