( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-353 - location
    l000-682 - location
    l000-853 - location
    l000-309 - location
    l000-600 - location
    l000-784 - location
    l000-122 - location
    l000-177 - location
    l000-482 - location
    l000-863 - location
    p544 - obj
    p273 - obj
    p571 - obj
    p675 - obj
    p17 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-353 c000 )
    ( in-city l000-682 c000 )
    ( in-city l000-853 c000 )
    ( in-city l000-309 c000 )
    ( in-city l000-600 c000 )
    ( in-city l000-784 c000 )
    ( in-city l000-122 c000 )
    ( in-city l000-177 c000 )
    ( in-city l000-482 c000 )
    ( in-city l000-863 c000 )
    ( obj-at p544 l000-177 )
    ( obj-at p273 l000-853 )
    ( obj-at p571 l000-853 )
    ( obj-at p675 l000-863 )
    ( obj-at p17 l000-309 )
  )
  ( :goal
    ( and
      ( obj-at p544 l000-000 )
      ( obj-at p273 l000-000 )
      ( obj-at p571 l000-000 )
      ( obj-at p675 l000-000 )
      ( obj-at p17 l000-000 )
    )
  )
)
