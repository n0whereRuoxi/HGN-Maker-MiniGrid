( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-827 - location
    l000-727 - location
    l000-786 - location
    l000-286 - location
    p207 - obj
    p535 - obj
    p523 - obj
    p367 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-827 c000 )
    ( in-city l000-727 c000 )
    ( in-city l000-786 c000 )
    ( in-city l000-286 c000 )
    ( obj-at p207 l000-827 )
    ( obj-at p535 l000-827 )
    ( obj-at p523 l000-786 )
    ( obj-at p367 l000-727 )
  )
  ( :goal
    ( and
      ( obj-at p207 l000-000 )
      ( obj-at p535 l000-000 )
      ( obj-at p523 l000-000 )
      ( obj-at p367 l000-000 )
    )
  )
)
