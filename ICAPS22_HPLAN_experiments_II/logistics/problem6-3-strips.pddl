( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-6 - location
    l000-369 - location
    l000-662 - location
    p521 - obj
    p934 - obj
    p810 - obj
    p789 - obj
    p481 - obj
    p361 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-6 c000 )
    ( in-city l000-369 c000 )
    ( in-city l000-662 c000 )
    ( obj-at p521 l000-369 )
    ( obj-at p934 l000-369 )
    ( obj-at p810 l000-6 )
    ( obj-at p789 l000-662 )
    ( obj-at p481 l000-369 )
    ( obj-at p361 l000-369 )
  )
  ( :goal
    ( and
      ( obj-at p521 l000-000 )
      ( obj-at p934 l000-000 )
      ( obj-at p810 l000-000 )
      ( obj-at p789 l000-000 )
      ( obj-at p481 l000-000 )
      ( obj-at p361 l000-000 )
    )
  )
)
