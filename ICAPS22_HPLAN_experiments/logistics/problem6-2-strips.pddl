( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-601 - location
    l000-654 - location
    l000-15 - location
    p424 - obj
    p542 - obj
    p995 - obj
    p615 - obj
    p945 - obj
    p663 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-601 c000 )
    ( in-city l000-654 c000 )
    ( in-city l000-15 c000 )
    ( obj-at p424 l000-15 )
    ( obj-at p542 l000-15 )
    ( obj-at p995 l000-15 )
    ( obj-at p615 l000-601 )
    ( obj-at p945 l000-601 )
    ( obj-at p663 l000-654 )
  )
  ( :goal
    ( and
      ( obj-at p424 l000-000 )
      ( obj-at p542 l000-000 )
      ( obj-at p995 l000-000 )
      ( obj-at p615 l000-000 )
      ( obj-at p945 l000-000 )
      ( obj-at p663 l000-000 )
    )
  )
)
