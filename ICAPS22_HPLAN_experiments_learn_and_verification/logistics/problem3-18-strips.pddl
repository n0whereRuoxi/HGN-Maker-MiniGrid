( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-499 - location
    l000-126 - location
    l000-796 - location
    l000-536 - location
    l000-449 - location
    p316 - obj
    p174 - obj
    p932 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-499 c000 )
    ( in-city l000-126 c000 )
    ( in-city l000-796 c000 )
    ( in-city l000-536 c000 )
    ( in-city l000-449 c000 )
    ( obj-at p316 l000-796 )
    ( obj-at p174 l000-499 )
    ( obj-at p932 l000-536 )
  )
  ( :goal
    ( and
      ( obj-at p316 l000-000 )
      ( obj-at p174 l000-000 )
      ( obj-at p932 l000-000 )
    )
  )
)
