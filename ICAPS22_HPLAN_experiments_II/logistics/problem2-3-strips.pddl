( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-261 - location
    p879 - obj
    p719 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-261 c000 )
    ( obj-at p879 l000-261 )
    ( obj-at p719 l000-261 )
  )
  ( :goal
    ( and
      ( obj-at p879 l000-000 )
      ( obj-at p719 l000-000 )
    )
  )
)
