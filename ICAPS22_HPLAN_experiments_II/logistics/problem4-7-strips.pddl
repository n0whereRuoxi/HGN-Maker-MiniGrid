( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-35 - location
    l000-846 - location
    l000-347 - location
    l000-268 - location
    l000-681 - location
    l000-909 - location
    l000-701 - location
    l000-424 - location
    p3 - obj
    p828 - obj
    p688 - obj
    p627 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-35 c000 )
    ( in-city l000-846 c000 )
    ( in-city l000-347 c000 )
    ( in-city l000-268 c000 )
    ( in-city l000-681 c000 )
    ( in-city l000-909 c000 )
    ( in-city l000-701 c000 )
    ( in-city l000-424 c000 )
    ( obj-at p3 l000-35 )
    ( obj-at p828 l000-347 )
    ( obj-at p688 l000-681 )
    ( obj-at p627 l000-701 )
  )
  ( :goal
    ( and
      ( obj-at p3 l000-000 )
      ( obj-at p828 l000-000 )
      ( obj-at p688 l000-000 )
      ( obj-at p627 l000-000 )
    )
  )
)
