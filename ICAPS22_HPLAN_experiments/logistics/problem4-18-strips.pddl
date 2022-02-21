( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-922 - location
    l000-419 - location
    p259 - obj
    p974 - obj
    p494 - obj
    p46 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-922 c000 )
    ( in-city l000-419 c000 )
    ( obj-at p259 l000-419 )
    ( obj-at p974 l000-922 )
    ( obj-at p494 l000-922 )
    ( obj-at p46 l000-419 )
  )
  ( :goal
    ( and
      ( obj-at p259 l000-000 )
      ( obj-at p974 l000-000 )
      ( obj-at p494 l000-000 )
      ( obj-at p46 l000-000 )
    )
  )
)
