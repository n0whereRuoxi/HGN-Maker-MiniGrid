( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-832 - location
    l000-650 - location
    l000-518 - location
    l000-654 - location
    l000-430 - location
    l000-259 - location
    l000-161 - location
    l000-10 - location
    l000-505 - location
    l000-263 - location
    l000-774 - location
    l000-853 - location
    p847 - obj
    p837 - obj
    p325 - obj
    p540 - obj
    p877 - obj
    p908 - obj
    p628 - obj
    p905 - obj
    p860 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-832 c000 )
    ( in-city l000-650 c000 )
    ( in-city l000-518 c000 )
    ( in-city l000-654 c000 )
    ( in-city l000-430 c000 )
    ( in-city l000-259 c000 )
    ( in-city l000-161 c000 )
    ( in-city l000-10 c000 )
    ( in-city l000-505 c000 )
    ( in-city l000-263 c000 )
    ( in-city l000-774 c000 )
    ( in-city l000-853 c000 )
    ( obj-at p847 l000-263 )
    ( obj-at p837 l000-650 )
    ( obj-at p325 l000-161 )
    ( obj-at p540 l000-654 )
    ( obj-at p877 l000-259 )
    ( obj-at p908 l000-259 )
    ( obj-at p628 l000-774 )
    ( obj-at p905 l000-518 )
    ( obj-at p860 l000-430 )
  )
  ( :goal
    ( and
      ( obj-at p847 l000-000 )
      ( obj-at p837 l000-000 )
      ( obj-at p325 l000-000 )
      ( obj-at p540 l000-000 )
      ( obj-at p877 l000-000 )
      ( obj-at p908 l000-000 )
      ( obj-at p628 l000-000 )
      ( obj-at p905 l000-000 )
      ( obj-at p860 l000-000 )
    )
  )
)
