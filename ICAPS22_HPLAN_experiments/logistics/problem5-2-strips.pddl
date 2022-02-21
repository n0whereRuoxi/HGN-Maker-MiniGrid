( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-679 - location
    l000-75 - location
    l000-156 - location
    l000-31 - location
    l000-210 - location
    l000-818 - location
    p950 - obj
    p789 - obj
    p850 - obj
    p440 - obj
    p804 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-679 c000 )
    ( in-city l000-75 c000 )
    ( in-city l000-156 c000 )
    ( in-city l000-31 c000 )
    ( in-city l000-210 c000 )
    ( in-city l000-818 c000 )
    ( obj-at p950 l000-210 )
    ( obj-at p789 l000-679 )
    ( obj-at p850 l000-31 )
    ( obj-at p440 l000-818 )
    ( obj-at p804 l000-156 )
  )
  ( :goal
    ( and
      ( obj-at p950 l000-000 )
      ( obj-at p789 l000-000 )
      ( obj-at p850 l000-000 )
      ( obj-at p440 l000-000 )
      ( obj-at p804 l000-000 )
    )
  )
)
