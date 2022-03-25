( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-504 - location
    l000-594 - location
    l000-659 - location
    p475 - obj
    p709 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-504 c000 )
    ( in-city l000-594 c000 )
    ( in-city l000-659 c000 )
    ( obj-at p475 l000-504 )
    ( obj-at p709 l000-594 )
  )
  ( :goal
    ( and
      ( obj-at p475 l000-000 )
      ( obj-at p709 l000-000 )
    )
  )
)
