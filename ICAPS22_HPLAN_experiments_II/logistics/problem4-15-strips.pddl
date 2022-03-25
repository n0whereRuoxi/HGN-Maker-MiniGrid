( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-727 - location
    l000-244 - location
    l000-366 - location
    l000-980 - location
    l000-880 - location
    l000-696 - location
    l000-794 - location
    p831 - obj
    p383 - obj
    p802 - obj
    p36 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-727 c000 )
    ( in-city l000-244 c000 )
    ( in-city l000-366 c000 )
    ( in-city l000-980 c000 )
    ( in-city l000-880 c000 )
    ( in-city l000-696 c000 )
    ( in-city l000-794 c000 )
    ( obj-at p831 l000-794 )
    ( obj-at p383 l000-880 )
    ( obj-at p802 l000-727 )
    ( obj-at p36 l000-244 )
  )
  ( :goal
    ( and
      ( obj-at p831 l000-000 )
      ( obj-at p383 l000-000 )
      ( obj-at p802 l000-000 )
      ( obj-at p36 l000-000 )
    )
  )
)
