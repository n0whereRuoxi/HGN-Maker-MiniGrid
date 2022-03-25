( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-543 - location
    l000-315 - location
    l000-196 - location
    p720 - obj
    p878 - obj
    p595 - obj
    p940 - obj
    p997 - obj
    p763 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-543 c000 )
    ( in-city l000-315 c000 )
    ( in-city l000-196 c000 )
    ( obj-at p720 l000-315 )
    ( obj-at p878 l000-315 )
    ( obj-at p595 l000-196 )
    ( obj-at p940 l000-315 )
    ( obj-at p997 l000-315 )
    ( obj-at p763 l000-196 )
  )
  ( :goal
    ( and
      ( obj-at p720 l000-000 )
      ( obj-at p878 l000-000 )
      ( obj-at p595 l000-000 )
      ( obj-at p940 l000-000 )
      ( obj-at p997 l000-000 )
      ( obj-at p763 l000-000 )
    )
  )
)
