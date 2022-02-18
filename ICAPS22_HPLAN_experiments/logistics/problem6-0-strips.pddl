( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-774 - location
    l000-46 - location
    l000-882 - location
    l000-783 - location
    l000-212 - location
    l000-315 - location
    l000-816 - location
    l000-652 - location
    l000-701 - location
    l000-715 - location
    l000-569 - location
    l000-996 - location
    p367 - obj
    p20 - obj
    p182 - obj
    p131 - obj
    p410 - obj
    p506 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-774 c000 )
    ( in-city l000-46 c000 )
    ( in-city l000-882 c000 )
    ( in-city l000-783 c000 )
    ( in-city l000-212 c000 )
    ( in-city l000-315 c000 )
    ( in-city l000-816 c000 )
    ( in-city l000-652 c000 )
    ( in-city l000-701 c000 )
    ( in-city l000-715 c000 )
    ( in-city l000-569 c000 )
    ( in-city l000-996 c000 )
    ( obj-at p367 l000-774 )
    ( obj-at p20 l000-46 )
    ( obj-at p182 l000-715 )
    ( obj-at p131 l000-882 )
    ( obj-at p410 l000-315 )
    ( obj-at p506 l000-774 )
  )
  ( :goal
    ( and
      ( obj-at p367 l000-000 )
      ( obj-at p20 l000-000 )
      ( obj-at p182 l000-000 )
      ( obj-at p131 l000-000 )
      ( obj-at p410 l000-000 )
      ( obj-at p506 l000-000 )
    )
  )
)
