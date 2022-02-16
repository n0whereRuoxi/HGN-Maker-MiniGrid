( define ( problem probname )

  ( :domain logistics )

  ( :requirements :strips :typing :equality )

  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-001 - location
    l000-002 - location
    p001 - obj
    p002 - obj
  )

  ( :init
    ( in-city l000-000 c000 )
    ( in-city l000-001 c000 )
    ( in-city l000-002 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( obj-at p001 l000-000 )
    ( obj-at p002 l000-000 )
  )

  ( :goal
    ( and
      ( obj-at p001 l000-001 )
      ( obj-at p002 l000-002 )
    )
  )
)


