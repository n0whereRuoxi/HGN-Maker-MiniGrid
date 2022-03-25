( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-157 - location
    l000-788 - location
    l000-663 - location
    l000-920 - location
    l000-603 - location
    l000-990 - location
    l000-94 - location
    p604 - obj
    p29 - obj
    p135 - obj
    p518 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-157 c000 )
    ( in-city l000-788 c000 )
    ( in-city l000-663 c000 )
    ( in-city l000-920 c000 )
    ( in-city l000-603 c000 )
    ( in-city l000-990 c000 )
    ( in-city l000-94 c000 )
    ( obj-at p604 l000-990 )
    ( obj-at p29 l000-603 )
    ( obj-at p135 l000-603 )
    ( obj-at p518 l000-603 )
  )
  ( :goal
    ( and
      ( obj-at p604 l000-000 )
      ( obj-at p29 l000-000 )
      ( obj-at p135 l000-000 )
      ( obj-at p518 l000-000 )
    )
  )
)
