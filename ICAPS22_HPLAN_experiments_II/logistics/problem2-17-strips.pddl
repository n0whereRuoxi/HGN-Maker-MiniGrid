( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-143 - location
    l000-896 - location
    l000-190 - location
    p599 - obj
    p23 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-143 c000 )
    ( in-city l000-896 c000 )
    ( in-city l000-190 c000 )
    ( obj-at p599 l000-190 )
    ( obj-at p23 l000-896 )
  )
  ( :goal
    ( and
      ( obj-at p599 l000-000 )
      ( obj-at p23 l000-000 )
    )
  )
)
