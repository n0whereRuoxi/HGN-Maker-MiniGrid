( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-243 - location
    l000-362 - location
    l000-899 - location
    l000-554 - location
    l000-66 - location
    p842 - obj
    p870 - obj
    p463 - obj
    p89 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-243 c000 )
    ( in-city l000-362 c000 )
    ( in-city l000-899 c000 )
    ( in-city l000-554 c000 )
    ( in-city l000-66 c000 )
    ( obj-at p842 l000-362 )
    ( obj-at p870 l000-554 )
    ( obj-at p463 l000-243 )
    ( obj-at p89 l000-362 )
  )
  ( :goal
    ( and
      ( obj-at p842 l000-000 )
      ( obj-at p870 l000-000 )
      ( obj-at p463 l000-000 )
      ( obj-at p89 l000-000 )
    )
  )
)
