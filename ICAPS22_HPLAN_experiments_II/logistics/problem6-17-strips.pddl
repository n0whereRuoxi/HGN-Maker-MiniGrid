( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-107 - location
    l000-189 - location
    l000-944 - location
    l000-779 - location
    l000-316 - location
    l000-23 - location
    p932 - obj
    p655 - obj
    p828 - obj
    p471 - obj
    p384 - obj
    p942 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-107 c000 )
    ( in-city l000-189 c000 )
    ( in-city l000-944 c000 )
    ( in-city l000-779 c000 )
    ( in-city l000-316 c000 )
    ( in-city l000-23 c000 )
    ( obj-at p932 l000-107 )
    ( obj-at p655 l000-779 )
    ( obj-at p828 l000-944 )
    ( obj-at p471 l000-316 )
    ( obj-at p384 l000-189 )
    ( obj-at p942 l000-107 )
  )
  ( :goal
    ( and
      ( obj-at p932 l000-000 )
      ( obj-at p655 l000-000 )
      ( obj-at p828 l000-000 )
      ( obj-at p471 l000-000 )
      ( obj-at p384 l000-000 )
      ( obj-at p942 l000-000 )
    )
  )
)
