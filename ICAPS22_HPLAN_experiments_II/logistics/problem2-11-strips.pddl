( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-121 - location
    l000-784 - location
    p969 - obj
    p626 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-121 c000 )
    ( in-city l000-784 c000 )
    ( obj-at p969 l000-121 )
    ( obj-at p626 l000-121 )
  )
  ( :goal
    ( and
      ( obj-at p969 l000-000 )
      ( obj-at p626 l000-000 )
    )
  )
)
