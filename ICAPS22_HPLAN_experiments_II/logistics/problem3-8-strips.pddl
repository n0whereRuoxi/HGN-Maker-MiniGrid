( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-694 - location
    l000-386 - location
    l000-611 - location
    l000-633 - location
    p840 - obj
    p491 - obj
    p874 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-694 c000 )
    ( in-city l000-386 c000 )
    ( in-city l000-611 c000 )
    ( in-city l000-633 c000 )
    ( obj-at p840 l000-386 )
    ( obj-at p491 l000-386 )
    ( obj-at p874 l000-611 )
  )
  ( :goal
    ( and
      ( obj-at p840 l000-000 )
      ( obj-at p491 l000-000 )
      ( obj-at p874 l000-000 )
    )
  )
)
