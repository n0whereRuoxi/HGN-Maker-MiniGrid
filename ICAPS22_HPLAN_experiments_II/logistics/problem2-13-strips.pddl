( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-290 - location
    l000-601 - location
    l000-378 - location
    l000-610 - location
    p736 - obj
    p730 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-290 c000 )
    ( in-city l000-601 c000 )
    ( in-city l000-378 c000 )
    ( in-city l000-610 c000 )
    ( obj-at p736 l000-610 )
    ( obj-at p730 l000-610 )
  )
  ( :goal
    ( and
      ( obj-at p736 l000-000 )
      ( obj-at p730 l000-000 )
    )
  )
)
