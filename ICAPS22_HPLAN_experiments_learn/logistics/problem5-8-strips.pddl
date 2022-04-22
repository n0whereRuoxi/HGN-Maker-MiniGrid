( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-957 - location
    l000-546 - location
    l000-226 - location
    l000-396 - location
    l000-381 - location
    l000-360 - location
    p938 - obj
    p952 - obj
    p150 - obj
    p572 - obj
    p824 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-957 c000 )
    ( in-city l000-546 c000 )
    ( in-city l000-226 c000 )
    ( in-city l000-396 c000 )
    ( in-city l000-381 c000 )
    ( in-city l000-360 c000 )
    ( obj-at p938 l000-226 )
    ( obj-at p952 l000-546 )
    ( obj-at p150 l000-226 )
    ( obj-at p572 l000-226 )
    ( obj-at p824 l000-546 )
  )
  ( :goal
    ( and
      ( obj-at p938 l000-000 )
      ( obj-at p952 l000-000 )
      ( obj-at p150 l000-000 )
      ( obj-at p572 l000-000 )
      ( obj-at p824 l000-000 )
    )
  )
)
