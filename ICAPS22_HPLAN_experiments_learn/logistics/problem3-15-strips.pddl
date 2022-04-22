( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-454 - location
    l000-973 - location
    l000-336 - location
    l000-939 - location
    l000-504 - location
    p915 - obj
    p3 - obj
    p547 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-454 c000 )
    ( in-city l000-973 c000 )
    ( in-city l000-336 c000 )
    ( in-city l000-939 c000 )
    ( in-city l000-504 c000 )
    ( obj-at p915 l000-504 )
    ( obj-at p3 l000-939 )
    ( obj-at p547 l000-454 )
  )
  ( :goal
    ( and
      ( obj-at p915 l000-000 )
      ( obj-at p3 l000-000 )
      ( obj-at p547 l000-000 )
    )
  )
)
