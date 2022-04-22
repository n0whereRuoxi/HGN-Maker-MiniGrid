( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-353 - location
    l000-424 - location
    p546 - obj
    p265 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-353 c000 )
    ( in-city l000-424 c000 )
    ( obj-at p546 l000-424 )
    ( obj-at p265 l000-424 )
  )
  ( :goal
    ( and
      ( obj-at p546 l000-000 )
      ( obj-at p265 l000-000 )
    )
  )
)
