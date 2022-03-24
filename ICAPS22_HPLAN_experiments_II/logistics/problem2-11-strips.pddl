( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-225 - location
    p268 - obj
    p910 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-225 c000 )
    ( obj-at p268 l000-225 )
    ( obj-at p910 l000-225 )
  )
  ( :goal
    ( and
      ( obj-at p268 l000-000 )
      ( obj-at p910 l000-000 )
    )
  )
)
