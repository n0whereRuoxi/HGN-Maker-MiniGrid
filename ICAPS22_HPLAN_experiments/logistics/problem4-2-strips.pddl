( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-591 - location
    l000-523 - location
    l000-379 - location
    l000-320 - location
    l000-781 - location
    l000-979 - location
    l000-866 - location
    p374 - obj
    p361 - obj
    p275 - obj
    p386 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-591 c000 )
    ( in-city l000-523 c000 )
    ( in-city l000-379 c000 )
    ( in-city l000-320 c000 )
    ( in-city l000-781 c000 )
    ( in-city l000-979 c000 )
    ( in-city l000-866 c000 )
    ( obj-at p374 l000-320 )
    ( obj-at p361 l000-979 )
    ( obj-at p275 l000-866 )
    ( obj-at p386 l000-523 )
  )
  ( :goal
    ( and
      ( obj-at p374 l000-000 )
      ( obj-at p361 l000-000 )
      ( obj-at p275 l000-000 )
      ( obj-at p386 l000-000 )
    )
  )
)
