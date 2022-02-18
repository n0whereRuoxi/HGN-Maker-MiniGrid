( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-738 - location
    l000-63 - location
    p419 - obj
    p875 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-738 c000 )
    ( in-city l000-63 c000 )
    ( obj-at p419 l000-63 )
    ( obj-at p875 l000-738 )
  )
  ( :goal
    ( and
      ( obj-at p419 l000-000 )
      ( obj-at p875 l000-000 )
    )
  )
)
