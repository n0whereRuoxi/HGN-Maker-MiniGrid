( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-983 - location
    l000-245 - location
    l000-682 - location
    l000-987 - location
    l000-567 - location
    l000-810 - location
    p971 - obj
    p640 - obj
    p167 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-983 c000 )
    ( in-city l000-245 c000 )
    ( in-city l000-682 c000 )
    ( in-city l000-987 c000 )
    ( in-city l000-567 c000 )
    ( in-city l000-810 c000 )
    ( obj-at p971 l000-983 )
    ( obj-at p640 l000-983 )
    ( obj-at p167 l000-567 )
  )
  ( :goal
    ( and
      ( obj-at p971 l000-000 )
      ( obj-at p640 l000-000 )
      ( obj-at p167 l000-000 )
    )
  )
)
