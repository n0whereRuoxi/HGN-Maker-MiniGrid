( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-591 - location
    l000-190 - location
    l000-930 - location
    l000-474 - location
    l000-924 - location
    l000-381 - location
    l000-822 - location
    l000-348 - location
    p190 - obj
    p381 - obj
    p822 - obj
    p822 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-591 c000 )
    ( in-city l000-190 c000 )
    ( in-city l000-930 c000 )
    ( in-city l000-474 c000 )
    ( in-city l000-924 c000 )
    ( in-city l000-381 c000 )
    ( in-city l000-822 c000 )
    ( in-city l000-348 c000 )
    ( obj-at p190 l000-190 )
    ( obj-at p381 l000-381 )
    ( obj-at p822 l000-822 )
    ( obj-at p822 l000-822 )
  )
  ( :goal
    ( and
      ( obj-at p190 l000-000 )
      ( obj-at p381 l000-000 )
      ( obj-at p822 l000-000 )
      ( obj-at p822 l000-000 )
    )
  )
)
