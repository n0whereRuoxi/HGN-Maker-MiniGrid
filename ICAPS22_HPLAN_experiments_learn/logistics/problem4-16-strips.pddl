( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-562 - location
    l000-519 - location
    l000-425 - location
    l000-162 - location
    l000-244 - location
    l000-659 - location
    l000-944 - location
    l000-291 - location
    p803 - obj
    p379 - obj
    p428 - obj
    p649 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-562 c000 )
    ( in-city l000-519 c000 )
    ( in-city l000-425 c000 )
    ( in-city l000-162 c000 )
    ( in-city l000-244 c000 )
    ( in-city l000-659 c000 )
    ( in-city l000-944 c000 )
    ( in-city l000-291 c000 )
    ( obj-at p803 l000-944 )
    ( obj-at p379 l000-244 )
    ( obj-at p428 l000-244 )
    ( obj-at p649 l000-562 )
  )
  ( :goal
    ( and
      ( obj-at p803 l000-000 )
      ( obj-at p379 l000-000 )
      ( obj-at p428 l000-000 )
      ( obj-at p649 l000-000 )
    )
  )
)
