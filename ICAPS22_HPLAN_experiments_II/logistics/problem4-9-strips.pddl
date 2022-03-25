( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-405 - location
    l000-199 - location
    l000-290 - location
    l000-169 - location
    l000-8 - location
    p451 - obj
    p421 - obj
    p479 - obj
    p954 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-405 c000 )
    ( in-city l000-199 c000 )
    ( in-city l000-290 c000 )
    ( in-city l000-169 c000 )
    ( in-city l000-8 c000 )
    ( obj-at p451 l000-405 )
    ( obj-at p421 l000-199 )
    ( obj-at p479 l000-199 )
    ( obj-at p954 l000-199 )
  )
  ( :goal
    ( and
      ( obj-at p451 l000-000 )
      ( obj-at p421 l000-000 )
      ( obj-at p479 l000-000 )
      ( obj-at p954 l000-000 )
    )
  )
)
