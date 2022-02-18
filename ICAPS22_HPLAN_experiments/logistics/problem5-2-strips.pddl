( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-680 - location
    l000-293 - location
    l000-126 - location
    l000-271 - location
    l000-190 - location
    l000-338 - location
    l000-933 - location
    l000-648 - location
    l000-968 - location
    p648 - obj
    p933 - obj
    p293 - obj
    p338 - obj
    p271 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-680 c000 )
    ( in-city l000-293 c000 )
    ( in-city l000-126 c000 )
    ( in-city l000-271 c000 )
    ( in-city l000-190 c000 )
    ( in-city l000-338 c000 )
    ( in-city l000-933 c000 )
    ( in-city l000-648 c000 )
    ( in-city l000-968 c000 )
    ( obj-at p648 l000-648 )
    ( obj-at p933 l000-933 )
    ( obj-at p293 l000-293 )
    ( obj-at p338 l000-338 )
    ( obj-at p271 l000-271 )
  )
  ( :goal
    ( and
      ( obj-at p648 l000-000 )
      ( obj-at p933 l000-000 )
      ( obj-at p293 l000-000 )
      ( obj-at p338 l000-000 )
      ( obj-at p271 l000-000 )
    )
  )
)
