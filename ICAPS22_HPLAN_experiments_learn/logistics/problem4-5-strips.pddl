( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-938 - location
    l000-471 - location
    l000-705 - location
    l000-16 - location
    l000-474 - location
    l000-272 - location
    l000-260 - location
    l000-396 - location
    p104 - obj
    p782 - obj
    p444 - obj
    p210 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-938 c000 )
    ( in-city l000-471 c000 )
    ( in-city l000-705 c000 )
    ( in-city l000-16 c000 )
    ( in-city l000-474 c000 )
    ( in-city l000-272 c000 )
    ( in-city l000-260 c000 )
    ( in-city l000-396 c000 )
    ( obj-at p104 l000-705 )
    ( obj-at p782 l000-938 )
    ( obj-at p444 l000-16 )
    ( obj-at p210 l000-705 )
  )
  ( :goal
    ( and
      ( obj-at p104 l000-000 )
      ( obj-at p782 l000-000 )
      ( obj-at p444 l000-000 )
      ( obj-at p210 l000-000 )
    )
  )
)
