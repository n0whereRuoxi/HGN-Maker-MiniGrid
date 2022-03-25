( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-685 - location
    l000-232 - location
    l000-332 - location
    l000-315 - location
    l000-106 - location
    l000-131 - location
    l000-214 - location
    l000-47 - location
    l000-273 - location
    l000-443 - location
    p331 - obj
    p370 - obj
    p238 - obj
    p536 - obj
    p800 - obj
    p565 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-685 c000 )
    ( in-city l000-232 c000 )
    ( in-city l000-332 c000 )
    ( in-city l000-315 c000 )
    ( in-city l000-106 c000 )
    ( in-city l000-131 c000 )
    ( in-city l000-214 c000 )
    ( in-city l000-47 c000 )
    ( in-city l000-273 c000 )
    ( in-city l000-443 c000 )
    ( obj-at p331 l000-131 )
    ( obj-at p370 l000-273 )
    ( obj-at p238 l000-315 )
    ( obj-at p536 l000-214 )
    ( obj-at p800 l000-106 )
    ( obj-at p565 l000-685 )
  )
  ( :goal
    ( and
      ( obj-at p331 l000-000 )
      ( obj-at p370 l000-000 )
      ( obj-at p238 l000-000 )
      ( obj-at p536 l000-000 )
      ( obj-at p800 l000-000 )
      ( obj-at p565 l000-000 )
    )
  )
)
