( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-487 - location
    l000-374 - location
    l000-828 - location
    l000-761 - location
    l000-394 - location
    p900 - obj
    p370 - obj
    p80 - obj
    p566 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-487 c000 )
    ( in-city l000-374 c000 )
    ( in-city l000-828 c000 )
    ( in-city l000-761 c000 )
    ( in-city l000-394 c000 )
    ( obj-at p900 l000-828 )
    ( obj-at p370 l000-394 )
    ( obj-at p80 l000-374 )
    ( obj-at p566 l000-761 )
  )
  ( :goal
    ( and
      ( obj-at p900 l000-000 )
      ( obj-at p370 l000-000 )
      ( obj-at p80 l000-000 )
      ( obj-at p566 l000-000 )
    )
  )
)
