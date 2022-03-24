( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-605 - location
    l000-556 - location
    l000-152 - location
    p471 - obj
    p349 - obj
    p805 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-605 c000 )
    ( in-city l000-556 c000 )
    ( in-city l000-152 c000 )
    ( obj-at p471 l000-556 )
    ( obj-at p349 l000-605 )
    ( obj-at p805 l000-152 )
  )
  ( :goal
    ( and
      ( obj-at p471 l000-000 )
      ( obj-at p349 l000-000 )
      ( obj-at p805 l000-000 )
    )
  )
)
