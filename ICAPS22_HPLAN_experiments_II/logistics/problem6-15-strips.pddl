( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-425 - location
    l000-864 - location
    l000-277 - location
    l000-777 - location
    l000-616 - location
    l000-468 - location
    l000-952 - location
    l000-969 - location
    l000-523 - location
    l000-629 - location
    p43 - obj
    p604 - obj
    p969 - obj
    p982 - obj
    p889 - obj
    p21 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-425 c000 )
    ( in-city l000-864 c000 )
    ( in-city l000-277 c000 )
    ( in-city l000-777 c000 )
    ( in-city l000-616 c000 )
    ( in-city l000-468 c000 )
    ( in-city l000-952 c000 )
    ( in-city l000-969 c000 )
    ( in-city l000-523 c000 )
    ( in-city l000-629 c000 )
    ( obj-at p43 l000-425 )
    ( obj-at p604 l000-523 )
    ( obj-at p969 l000-969 )
    ( obj-at p982 l000-468 )
    ( obj-at p889 l000-616 )
    ( obj-at p21 l000-425 )
  )
  ( :goal
    ( and
      ( obj-at p43 l000-000 )
      ( obj-at p604 l000-000 )
      ( obj-at p969 l000-000 )
      ( obj-at p982 l000-000 )
      ( obj-at p889 l000-000 )
      ( obj-at p21 l000-000 )
    )
  )
)
