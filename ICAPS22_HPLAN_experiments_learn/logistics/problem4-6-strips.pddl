( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-528 - location
    l000-558 - location
    l000-279 - location
    l000-997 - location
    l000-905 - location
    l000-850 - location
    l000-414 - location
    p126 - obj
    p779 - obj
    p826 - obj
    p978 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-528 c000 )
    ( in-city l000-558 c000 )
    ( in-city l000-279 c000 )
    ( in-city l000-997 c000 )
    ( in-city l000-905 c000 )
    ( in-city l000-850 c000 )
    ( in-city l000-414 c000 )
    ( obj-at p126 l000-997 )
    ( obj-at p779 l000-414 )
    ( obj-at p826 l000-414 )
    ( obj-at p978 l000-279 )
  )
  ( :goal
    ( and
      ( obj-at p126 l000-000 )
      ( obj-at p779 l000-000 )
      ( obj-at p826 l000-000 )
      ( obj-at p978 l000-000 )
    )
  )
)
