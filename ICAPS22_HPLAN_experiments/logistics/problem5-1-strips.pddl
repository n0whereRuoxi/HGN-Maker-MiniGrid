( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-389 - location
    l000-87 - location
    l000-146 - location
    l000-898 - location
    l000-675 - location
    l000-743 - location
    l000-727 - location
    l000-529 - location
    p338 - obj
    p101 - obj
    p408 - obj
    p547 - obj
    p293 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-389 c000 )
    ( in-city l000-87 c000 )
    ( in-city l000-146 c000 )
    ( in-city l000-898 c000 )
    ( in-city l000-675 c000 )
    ( in-city l000-743 c000 )
    ( in-city l000-727 c000 )
    ( in-city l000-529 c000 )
    ( obj-at p338 l000-87 )
    ( obj-at p101 l000-898 )
    ( obj-at p408 l000-675 )
    ( obj-at p547 l000-389 )
    ( obj-at p293 l000-87 )
  )
  ( :goal
    ( and
      ( obj-at p338 l000-000 )
      ( obj-at p101 l000-000 )
      ( obj-at p408 l000-000 )
      ( obj-at p547 l000-000 )
      ( obj-at p293 l000-000 )
    )
  )
)
