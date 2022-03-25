( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-146 - location
    l000-552 - location
    p990 - obj
    p78 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-146 c000 )
    ( in-city l000-552 c000 )
    ( obj-at p990 l000-552 )
    ( obj-at p78 l000-552 )
  )
  ( :goal
    ( and
      ( obj-at p990 l000-000 )
      ( obj-at p78 l000-000 )
    )
  )
)
