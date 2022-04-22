( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-775 - location
    l000-127 - location
    l000-357 - location
    p78 - obj
    p858 - obj
    p195 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-775 c000 )
    ( in-city l000-127 c000 )
    ( in-city l000-357 c000 )
    ( obj-at p78 l000-127 )
    ( obj-at p858 l000-775 )
    ( obj-at p195 l000-775 )
  )
  ( :goal
    ( and
      ( obj-at p78 l000-000 )
      ( obj-at p858 l000-000 )
      ( obj-at p195 l000-000 )
    )
  )
)
