( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-813 - location
    l000-487 - location
    l000-386 - location
    p464 - obj
    p711 - obj
    p398 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-813 c000 )
    ( in-city l000-487 c000 )
    ( in-city l000-386 c000 )
    ( obj-at p464 l000-487 )
    ( obj-at p711 l000-487 )
    ( obj-at p398 l000-487 )
  )
  ( :goal
    ( and
      ( obj-at p464 l000-000 )
      ( obj-at p711 l000-000 )
      ( obj-at p398 l000-000 )
    )
  )
)
