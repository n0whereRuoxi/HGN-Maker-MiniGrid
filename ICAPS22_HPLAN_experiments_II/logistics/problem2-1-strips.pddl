( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-150 - location
    l000-848 - location
    l000-415 - location
    l000-488 - location
    p760 - obj
    p331 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-150 c000 )
    ( in-city l000-848 c000 )
    ( in-city l000-415 c000 )
    ( in-city l000-488 c000 )
    ( obj-at p760 l000-488 )
    ( obj-at p331 l000-150 )
  )
  ( :goal
    ( and
      ( obj-at p760 l000-000 )
      ( obj-at p331 l000-000 )
    )
  )
)
