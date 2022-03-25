( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-802 - location
    l000-450 - location
    l000-217 - location
    l000-467 - location
    l000-937 - location
    l000-314 - location
    p895 - obj
    p758 - obj
    p685 - obj
    p463 - obj
    p12 - obj
    p545 - obj
    p837 - obj
    p308 - obj
    p505 - obj
    p670 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-802 c000 )
    ( in-city l000-450 c000 )
    ( in-city l000-217 c000 )
    ( in-city l000-467 c000 )
    ( in-city l000-937 c000 )
    ( in-city l000-314 c000 )
    ( obj-at p895 l000-802 )
    ( obj-at p758 l000-450 )
    ( obj-at p685 l000-314 )
    ( obj-at p463 l000-467 )
    ( obj-at p12 l000-467 )
    ( obj-at p545 l000-937 )
    ( obj-at p837 l000-314 )
    ( obj-at p308 l000-802 )
    ( obj-at p505 l000-467 )
    ( obj-at p670 l000-450 )
  )
  ( :goal
    ( and
      ( obj-at p895 l000-000 )
      ( obj-at p758 l000-000 )
      ( obj-at p685 l000-000 )
      ( obj-at p463 l000-000 )
      ( obj-at p12 l000-000 )
      ( obj-at p545 l000-000 )
      ( obj-at p837 l000-000 )
      ( obj-at p308 l000-000 )
      ( obj-at p505 l000-000 )
      ( obj-at p670 l000-000 )
    )
  )
)
