( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-827 - location
    l000-496 - location
    l000-487 - location
    l000-400 - location
    l000-468 - location
    l000-629 - location
    p547 - obj
    p128 - obj
    p901 - obj
    p818 - obj
    p965 - obj
    p685 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-827 c000 )
    ( in-city l000-496 c000 )
    ( in-city l000-487 c000 )
    ( in-city l000-400 c000 )
    ( in-city l000-468 c000 )
    ( in-city l000-629 c000 )
    ( obj-at p547 l000-487 )
    ( obj-at p128 l000-400 )
    ( obj-at p901 l000-827 )
    ( obj-at p818 l000-827 )
    ( obj-at p965 l000-827 )
    ( obj-at p685 l000-400 )
  )
  ( :goal
    ( and
      ( obj-at p547 l000-000 )
      ( obj-at p128 l000-000 )
      ( obj-at p901 l000-000 )
      ( obj-at p818 l000-000 )
      ( obj-at p965 l000-000 )
      ( obj-at p685 l000-000 )
    )
  )
)
