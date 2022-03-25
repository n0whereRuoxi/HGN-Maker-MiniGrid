( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-56 - location
    l000-597 - location
    l000-635 - location
    p463 - obj
    p816 - obj
    p822 - obj
    p542 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-56 c000 )
    ( in-city l000-597 c000 )
    ( in-city l000-635 c000 )
    ( obj-at p463 l000-635 )
    ( obj-at p816 l000-597 )
    ( obj-at p822 l000-597 )
    ( obj-at p542 l000-597 )
  )
  ( :goal
    ( and
      ( obj-at p463 l000-000 )
      ( obj-at p816 l000-000 )
      ( obj-at p822 l000-000 )
      ( obj-at p542 l000-000 )
    )
  )
)
