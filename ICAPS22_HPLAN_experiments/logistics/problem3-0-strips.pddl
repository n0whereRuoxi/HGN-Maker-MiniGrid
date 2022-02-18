( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-928 - location
    l000-696 - location
    p720 - obj
    p826 - obj
    p504 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-928 c000 )
    ( in-city l000-696 c000 )
    ( obj-at p720 l000-928 )
    ( obj-at p826 l000-696 )
    ( obj-at p504 l000-696 )
  )
  ( :goal
    ( and
      ( obj-at p720 l000-000 )
      ( obj-at p826 l000-000 )
      ( obj-at p504 l000-000 )
    )
  )
)
