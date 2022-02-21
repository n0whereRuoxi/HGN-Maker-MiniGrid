( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-610 - location
    l000-589 - location
    p785 - obj
    p439 - obj
    p281 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-610 c000 )
    ( in-city l000-589 c000 )
    ( obj-at p785 l000-610 )
    ( obj-at p439 l000-589 )
    ( obj-at p281 l000-589 )
  )
  ( :goal
    ( and
      ( obj-at p785 l000-000 )
      ( obj-at p439 l000-000 )
      ( obj-at p281 l000-000 )
    )
  )
)
