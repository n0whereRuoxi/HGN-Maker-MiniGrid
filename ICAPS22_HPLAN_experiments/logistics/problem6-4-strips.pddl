( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-486 - location
    l000-671 - location
    l000-81 - location
    p839 - obj
    p156 - obj
    p138 - obj
    p105 - obj
    p465 - obj
    p827 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-486 c000 )
    ( in-city l000-671 c000 )
    ( in-city l000-81 c000 )
    ( obj-at p839 l000-486 )
    ( obj-at p156 l000-81 )
    ( obj-at p138 l000-486 )
    ( obj-at p105 l000-486 )
    ( obj-at p465 l000-671 )
    ( obj-at p827 l000-486 )
  )
  ( :goal
    ( and
      ( obj-at p839 l000-000 )
      ( obj-at p156 l000-000 )
      ( obj-at p138 l000-000 )
      ( obj-at p105 l000-000 )
      ( obj-at p465 l000-000 )
      ( obj-at p827 l000-000 )
    )
  )
)
