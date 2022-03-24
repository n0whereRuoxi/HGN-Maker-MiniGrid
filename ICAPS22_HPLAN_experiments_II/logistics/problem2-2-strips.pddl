( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-168 - location
    p331 - obj
    p198 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-168 c000 )
    ( obj-at p331 l000-168 )
    ( obj-at p198 l000-168 )
  )
  ( :goal
    ( and
      ( obj-at p331 l000-000 )
      ( obj-at p198 l000-000 )
    )
  )
)
