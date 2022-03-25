( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-379 - location
    l000-364 - location
    l000-875 - location
    l000-421 - location
    l000-651 - location
    p889 - obj
    p506 - obj
    p325 - obj
    p248 - obj
    p510 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-379 c000 )
    ( in-city l000-364 c000 )
    ( in-city l000-875 c000 )
    ( in-city l000-421 c000 )
    ( in-city l000-651 c000 )
    ( obj-at p889 l000-379 )
    ( obj-at p506 l000-364 )
    ( obj-at p325 l000-379 )
    ( obj-at p248 l000-651 )
    ( obj-at p510 l000-421 )
  )
  ( :goal
    ( and
      ( obj-at p889 l000-000 )
      ( obj-at p506 l000-000 )
      ( obj-at p325 l000-000 )
      ( obj-at p248 l000-000 )
      ( obj-at p510 l000-000 )
    )
  )
)
