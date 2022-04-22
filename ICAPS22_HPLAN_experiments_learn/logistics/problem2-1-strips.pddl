( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-998 - location
    l000-170 - location
    l000-451 - location
    p657 - obj
    p795 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-998 c000 )
    ( in-city l000-170 c000 )
    ( in-city l000-451 c000 )
    ( obj-at p657 l000-998 )
    ( obj-at p795 l000-451 )
  )
  ( :goal
    ( and
      ( obj-at p657 l000-000 )
      ( obj-at p795 l000-000 )
    )
  )
)
