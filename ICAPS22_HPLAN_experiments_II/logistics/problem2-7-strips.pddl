( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-410 - location
    l000-917 - location
    p990 - obj
    p460 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-410 c000 )
    ( in-city l000-917 c000 )
    ( obj-at p990 l000-410 )
    ( obj-at p460 l000-410 )
  )
  ( :goal
    ( and
      ( obj-at p990 l000-000 )
      ( obj-at p460 l000-000 )
    )
  )
)
