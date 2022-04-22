( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-223 - location
    l000-102 - location
    p8 - obj
    p384 - obj
    p475 - obj
    p69 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-223 c000 )
    ( in-city l000-102 c000 )
    ( obj-at p8 l000-102 )
    ( obj-at p384 l000-102 )
    ( obj-at p475 l000-102 )
    ( obj-at p69 l000-102 )
  )
  ( :goal
    ( and
      ( obj-at p8 l000-000 )
      ( obj-at p384 l000-000 )
      ( obj-at p475 l000-000 )
      ( obj-at p69 l000-000 )
    )
  )
)
