( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-75 - location
    l000-429 - location
    l000-82 - location
    l000-85 - location
    l000-942 - location
    l000-471 - location
    l000-173 - location
    l000-161 - location
    l000-504 - location
    p686 - obj
    p673 - obj
    p358 - obj
    p991 - obj
    p879 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-75 c000 )
    ( in-city l000-429 c000 )
    ( in-city l000-82 c000 )
    ( in-city l000-85 c000 )
    ( in-city l000-942 c000 )
    ( in-city l000-471 c000 )
    ( in-city l000-173 c000 )
    ( in-city l000-161 c000 )
    ( in-city l000-504 c000 )
    ( obj-at p686 l000-471 )
    ( obj-at p673 l000-471 )
    ( obj-at p358 l000-161 )
    ( obj-at p991 l000-161 )
    ( obj-at p879 l000-471 )
  )
  ( :goal
    ( and
      ( obj-at p686 l000-000 )
      ( obj-at p673 l000-000 )
      ( obj-at p358 l000-000 )
      ( obj-at p991 l000-000 )
      ( obj-at p879 l000-000 )
    )
  )
)
