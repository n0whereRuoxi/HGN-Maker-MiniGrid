( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-598 - location
    l000-120 - location
    l000-119 - location
    p461 - obj
    p661 - obj
    p615 - obj
    p850 - obj
    p245 - obj
    p386 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-598 c000 )
    ( in-city l000-120 c000 )
    ( in-city l000-119 c000 )
    ( obj-at p461 l000-598 )
    ( obj-at p661 l000-598 )
    ( obj-at p615 l000-598 )
    ( obj-at p850 l000-119 )
    ( obj-at p245 l000-119 )
    ( obj-at p386 l000-119 )
  )
  ( :goal
    ( and
      ( obj-at p461 l000-000 )
      ( obj-at p661 l000-000 )
      ( obj-at p615 l000-000 )
      ( obj-at p850 l000-000 )
      ( obj-at p245 l000-000 )
      ( obj-at p386 l000-000 )
    )
  )
)
