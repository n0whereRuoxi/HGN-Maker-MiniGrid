( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-733 - location
    l000-190 - location
    p990 - obj
    p871 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-733 c000 )
    ( in-city l000-190 c000 )
    ( obj-at p990 l000-733 )
    ( obj-at p871 l000-733 )
  )
  ( :goal
    ( and
      ( obj-at p990 l000-000 )
      ( obj-at p871 l000-000 )
    )
  )
)
