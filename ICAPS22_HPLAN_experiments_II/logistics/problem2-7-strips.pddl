( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-538 - location
    l000-694 - location
    p101 - obj
    p977 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-538 c000 )
    ( in-city l000-694 c000 )
    ( obj-at p101 l000-694 )
    ( obj-at p977 l000-694 )
  )
  ( :goal
    ( and
      ( obj-at p101 l000-000 )
      ( obj-at p977 l000-000 )
    )
  )
)
