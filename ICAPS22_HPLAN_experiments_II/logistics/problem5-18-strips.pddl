( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-813 - location
    l000-627 - location
    l000-25 - location
    l000-239 - location
    l000-826 - location
    l000-939 - location
    p348 - obj
    p28 - obj
    p465 - obj
    p516 - obj
    p750 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-813 c000 )
    ( in-city l000-627 c000 )
    ( in-city l000-25 c000 )
    ( in-city l000-239 c000 )
    ( in-city l000-826 c000 )
    ( in-city l000-939 c000 )
    ( obj-at p348 l000-826 )
    ( obj-at p28 l000-939 )
    ( obj-at p465 l000-239 )
    ( obj-at p516 l000-627 )
    ( obj-at p750 l000-627 )
  )
  ( :goal
    ( and
      ( obj-at p348 l000-000 )
      ( obj-at p28 l000-000 )
      ( obj-at p465 l000-000 )
      ( obj-at p516 l000-000 )
      ( obj-at p750 l000-000 )
    )
  )
)
