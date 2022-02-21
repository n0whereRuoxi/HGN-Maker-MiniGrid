( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-245 - location
    l000-62 - location
    l000-827 - location
    p428 - obj
    p282 - obj
    p690 - obj
    p466 - obj
    p590 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-245 c000 )
    ( in-city l000-62 c000 )
    ( in-city l000-827 c000 )
    ( obj-at p428 l000-827 )
    ( obj-at p282 l000-62 )
    ( obj-at p690 l000-245 )
    ( obj-at p466 l000-827 )
    ( obj-at p590 l000-245 )
  )
  ( :goal
    ( and
      ( obj-at p428 l000-000 )
      ( obj-at p282 l000-000 )
      ( obj-at p690 l000-000 )
      ( obj-at p466 l000-000 )
      ( obj-at p590 l000-000 )
    )
  )
)
