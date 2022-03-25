( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-124 - location
    l000-221 - location
    l000-924 - location
    l000-110 - location
    l000-78 - location
    p2 - obj
    p737 - obj
    p975 - obj
    p167 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-124 c000 )
    ( in-city l000-221 c000 )
    ( in-city l000-924 c000 )
    ( in-city l000-110 c000 )
    ( in-city l000-78 c000 )
    ( obj-at p2 l000-124 )
    ( obj-at p737 l000-78 )
    ( obj-at p975 l000-110 )
    ( obj-at p167 l000-221 )
  )
  ( :goal
    ( and
      ( obj-at p2 l000-000 )
      ( obj-at p737 l000-000 )
      ( obj-at p975 l000-000 )
      ( obj-at p167 l000-000 )
    )
  )
)
