( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-341 - location
    l000-405 - location
    l000-844 - location
    l000-730 - location
    l000-139 - location
    l000-948 - location
    l000-708 - location
    l000-827 - location
    l000-615 - location
    l000-985 - location
    l000-987 - location
    l000-868 - location
    p211 - obj
    p869 - obj
    p339 - obj
    p55 - obj
    p667 - obj
    p204 - obj
    p832 - obj
    p175 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-341 c000 )
    ( in-city l000-405 c000 )
    ( in-city l000-844 c000 )
    ( in-city l000-730 c000 )
    ( in-city l000-139 c000 )
    ( in-city l000-948 c000 )
    ( in-city l000-708 c000 )
    ( in-city l000-827 c000 )
    ( in-city l000-615 c000 )
    ( in-city l000-985 c000 )
    ( in-city l000-987 c000 )
    ( in-city l000-868 c000 )
    ( obj-at p211 l000-341 )
    ( obj-at p869 l000-985 )
    ( obj-at p339 l000-708 )
    ( obj-at p55 l000-405 )
    ( obj-at p667 l000-139 )
    ( obj-at p204 l000-730 )
    ( obj-at p832 l000-948 )
    ( obj-at p175 l000-341 )
  )
  ( :goal
    ( and
      ( obj-at p211 l000-000 )
      ( obj-at p869 l000-000 )
      ( obj-at p339 l000-000 )
      ( obj-at p55 l000-000 )
      ( obj-at p667 l000-000 )
      ( obj-at p204 l000-000 )
      ( obj-at p832 l000-000 )
      ( obj-at p175 l000-000 )
    )
  )
)
