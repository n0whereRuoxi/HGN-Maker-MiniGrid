( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-966 - location
    l000-282 - location
    l000-64 - location
    l000-832 - location
    l000-699 - location
    l000-518 - location
    l000-615 - location
    l000-303 - location
    l000-760 - location
    p338 - obj
    p113 - obj
    p293 - obj
    p675 - obj
    p463 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-966 c000 )
    ( in-city l000-282 c000 )
    ( in-city l000-64 c000 )
    ( in-city l000-832 c000 )
    ( in-city l000-699 c000 )
    ( in-city l000-518 c000 )
    ( in-city l000-615 c000 )
    ( in-city l000-303 c000 )
    ( in-city l000-760 c000 )
    ( obj-at p338 l000-832 )
    ( obj-at p113 l000-760 )
    ( obj-at p293 l000-699 )
    ( obj-at p675 l000-64 )
    ( obj-at p463 l000-832 )
  )
  ( :goal
    ( and
      ( obj-at p338 l000-000 )
      ( obj-at p113 l000-000 )
      ( obj-at p293 l000-000 )
      ( obj-at p675 l000-000 )
      ( obj-at p463 l000-000 )
    )
  )
)
