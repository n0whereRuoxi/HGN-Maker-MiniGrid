( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-277 - location
    l000-267 - location
    l000-710 - location
    l000-99 - location
    l000-820 - location
    l000-252 - location
    l000-655 - location
    l000-806 - location
    l000-511 - location
    p253 - obj
    p426 - obj
    p932 - obj
    p83 - obj
    p188 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-277 c000 )
    ( in-city l000-267 c000 )
    ( in-city l000-710 c000 )
    ( in-city l000-99 c000 )
    ( in-city l000-820 c000 )
    ( in-city l000-252 c000 )
    ( in-city l000-655 c000 )
    ( in-city l000-806 c000 )
    ( in-city l000-511 c000 )
    ( obj-at p253 l000-267 )
    ( obj-at p426 l000-252 )
    ( obj-at p932 l000-511 )
    ( obj-at p83 l000-252 )
    ( obj-at p188 l000-267 )
  )
  ( :goal
    ( and
      ( obj-at p253 l000-000 )
      ( obj-at p426 l000-000 )
      ( obj-at p932 l000-000 )
      ( obj-at p83 l000-000 )
      ( obj-at p188 l000-000 )
    )
  )
)
