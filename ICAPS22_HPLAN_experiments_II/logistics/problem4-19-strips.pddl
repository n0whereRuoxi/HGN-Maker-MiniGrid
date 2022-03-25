( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-711 - location
    l000-288 - location
    l000-253 - location
    p778 - obj
    p78 - obj
    p461 - obj
    p923 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-711 c000 )
    ( in-city l000-288 c000 )
    ( in-city l000-253 c000 )
    ( obj-at p778 l000-288 )
    ( obj-at p78 l000-711 )
    ( obj-at p461 l000-253 )
    ( obj-at p923 l000-288 )
  )
  ( :goal
    ( and
      ( obj-at p778 l000-000 )
      ( obj-at p78 l000-000 )
      ( obj-at p461 l000-000 )
      ( obj-at p923 l000-000 )
    )
  )
)
