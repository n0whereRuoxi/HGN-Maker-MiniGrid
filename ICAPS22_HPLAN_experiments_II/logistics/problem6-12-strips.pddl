( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-746 - location
    l000-108 - location
    l000-22 - location
    l000-433 - location
    l000-852 - location
    l000-16 - location
    l000-112 - location
    l000-784 - location
    l000-389 - location
    l000-199 - location
    l000-458 - location
    p1 - obj
    p965 - obj
    p924 - obj
    p462 - obj
    p848 - obj
    p712 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-746 c000 )
    ( in-city l000-108 c000 )
    ( in-city l000-22 c000 )
    ( in-city l000-433 c000 )
    ( in-city l000-852 c000 )
    ( in-city l000-16 c000 )
    ( in-city l000-112 c000 )
    ( in-city l000-784 c000 )
    ( in-city l000-389 c000 )
    ( in-city l000-199 c000 )
    ( in-city l000-458 c000 )
    ( obj-at p1 l000-112 )
    ( obj-at p965 l000-852 )
    ( obj-at p924 l000-22 )
    ( obj-at p462 l000-22 )
    ( obj-at p848 l000-22 )
    ( obj-at p712 l000-16 )
  )
  ( :goal
    ( and
      ( obj-at p1 l000-000 )
      ( obj-at p965 l000-000 )
      ( obj-at p924 l000-000 )
      ( obj-at p462 l000-000 )
      ( obj-at p848 l000-000 )
      ( obj-at p712 l000-000 )
    )
  )
)
