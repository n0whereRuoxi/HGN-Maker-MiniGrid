( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-338 - location
    l000-734 - location
    l000-266 - location
    l000-468 - location
    p349 - obj
    p706 - obj
    p30 - obj
    p963 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-338 c000 )
    ( in-city l000-734 c000 )
    ( in-city l000-266 c000 )
    ( in-city l000-468 c000 )
    ( obj-at p349 l000-734 )
    ( obj-at p706 l000-266 )
    ( obj-at p30 l000-266 )
    ( obj-at p963 l000-734 )
  )
  ( :goal
    ( and
      ( obj-at p349 l000-000 )
      ( obj-at p706 l000-000 )
      ( obj-at p30 l000-000 )
      ( obj-at p963 l000-000 )
    )
  )
)
