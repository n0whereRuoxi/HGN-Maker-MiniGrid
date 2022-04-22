( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-908 - location
    l000-870 - location
    l000-859 - location
    l000-915 - location
    l000-848 - location
    p16 - obj
    p184 - obj
    p595 - obj
    p86 - obj
    p430 - obj
    p376 - obj
    p230 - obj
    p195 - obj
    p172 - obj
    p462 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-908 c000 )
    ( in-city l000-870 c000 )
    ( in-city l000-859 c000 )
    ( in-city l000-915 c000 )
    ( in-city l000-848 c000 )
    ( obj-at p16 l000-908 )
    ( obj-at p184 l000-908 )
    ( obj-at p595 l000-870 )
    ( obj-at p86 l000-870 )
    ( obj-at p430 l000-915 )
    ( obj-at p376 l000-848 )
    ( obj-at p230 l000-915 )
    ( obj-at p195 l000-848 )
    ( obj-at p172 l000-915 )
    ( obj-at p462 l000-859 )
  )
  ( :goal
    ( and
      ( obj-at p16 l000-000 )
      ( obj-at p184 l000-000 )
      ( obj-at p595 l000-000 )
      ( obj-at p86 l000-000 )
      ( obj-at p430 l000-000 )
      ( obj-at p376 l000-000 )
      ( obj-at p230 l000-000 )
      ( obj-at p195 l000-000 )
      ( obj-at p172 l000-000 )
      ( obj-at p462 l000-000 )
    )
  )
)
