( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-696 - location
    l000-963 - location
    l000-341 - location
    l000-486 - location
    l000-958 - location
    l000-252 - location
    l000-213 - location
    l000-236 - location
    l000-130 - location
    l000-982 - location
    l000-953 - location
    l000-946 - location
    p715 - obj
    p58 - obj
    p724 - obj
    p653 - obj
    p975 - obj
    p908 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-696 c000 )
    ( in-city l000-963 c000 )
    ( in-city l000-341 c000 )
    ( in-city l000-486 c000 )
    ( in-city l000-958 c000 )
    ( in-city l000-252 c000 )
    ( in-city l000-213 c000 )
    ( in-city l000-236 c000 )
    ( in-city l000-130 c000 )
    ( in-city l000-982 c000 )
    ( in-city l000-953 c000 )
    ( in-city l000-946 c000 )
    ( obj-at p715 l000-963 )
    ( obj-at p58 l000-341 )
    ( obj-at p724 l000-486 )
    ( obj-at p653 l000-953 )
    ( obj-at p975 l000-486 )
    ( obj-at p908 l000-982 )
  )
  ( :goal
    ( and
      ( obj-at p715 l000-000 )
      ( obj-at p58 l000-000 )
      ( obj-at p724 l000-000 )
      ( obj-at p653 l000-000 )
      ( obj-at p975 l000-000 )
      ( obj-at p908 l000-000 )
    )
  )
)
