( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-533 - location
    l000-349 - location
    p927 - obj
    p305 - obj
    p605 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-533 c000 )
    ( in-city l000-349 c000 )
    ( obj-at p927 l000-349 )
    ( obj-at p305 l000-533 )
    ( obj-at p605 l000-349 )
  )
  ( :goal
    ( and
      ( obj-at p927 l000-000 )
      ( obj-at p305 l000-000 )
      ( obj-at p605 l000-000 )
    )
  )
)
