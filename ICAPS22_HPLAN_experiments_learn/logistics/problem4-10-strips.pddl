( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-636 - location
    l000-565 - location
    l000-157 - location
    p689 - obj
    p508 - obj
    p884 - obj
    p857 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-636 c000 )
    ( in-city l000-565 c000 )
    ( in-city l000-157 c000 )
    ( obj-at p689 l000-565 )
    ( obj-at p508 l000-157 )
    ( obj-at p884 l000-157 )
    ( obj-at p857 l000-565 )
  )
  ( :goal
    ( and
      ( obj-at p689 l000-000 )
      ( obj-at p508 l000-000 )
      ( obj-at p884 l000-000 )
      ( obj-at p857 l000-000 )
    )
  )
)
