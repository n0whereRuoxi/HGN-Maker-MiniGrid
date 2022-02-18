( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-468 - location
    l000-894 - location
    l000-986 - location
    l000-391 - location
    p662 - obj
    p815 - obj
    p251 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-468 c000 )
    ( in-city l000-894 c000 )
    ( in-city l000-986 c000 )
    ( in-city l000-391 c000 )
    ( obj-at p662 l000-391 )
    ( obj-at p815 l000-468 )
    ( obj-at p251 l000-986 )
  )
  ( :goal
    ( and
      ( obj-at p662 l000-000 )
      ( obj-at p815 l000-000 )
      ( obj-at p251 l000-000 )
    )
  )
)
