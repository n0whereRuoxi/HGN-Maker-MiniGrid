( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-660 - location
    l000-166 - location
    l000-259 - location
    l000-638 - location
    l000-672 - location
    l000-947 - location
    l000-328 - location
    l000-148 - location
    l000-564 - location
    l000-352 - location
    p142 - obj
    p569 - obj
    p905 - obj
    p963 - obj
    p828 - obj
    p505 - obj
    p337 - obj
    p986 - obj
    p194 - obj
    p969 - obj
    p550 - obj
    p915 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-660 c000 )
    ( in-city l000-166 c000 )
    ( in-city l000-259 c000 )
    ( in-city l000-638 c000 )
    ( in-city l000-672 c000 )
    ( in-city l000-947 c000 )
    ( in-city l000-328 c000 )
    ( in-city l000-148 c000 )
    ( in-city l000-564 c000 )
    ( in-city l000-352 c000 )
    ( obj-at p142 l000-166 )
    ( obj-at p569 l000-638 )
    ( obj-at p905 l000-638 )
    ( obj-at p963 l000-564 )
    ( obj-at p828 l000-947 )
    ( obj-at p505 l000-947 )
    ( obj-at p337 l000-660 )
    ( obj-at p986 l000-564 )
    ( obj-at p194 l000-328 )
    ( obj-at p969 l000-947 )
    ( obj-at p550 l000-352 )
    ( obj-at p915 l000-166 )
  )
  ( :goal
    ( and
      ( obj-at p142 l000-000 )
      ( obj-at p569 l000-000 )
      ( obj-at p905 l000-000 )
      ( obj-at p963 l000-000 )
      ( obj-at p828 l000-000 )
      ( obj-at p505 l000-000 )
      ( obj-at p337 l000-000 )
      ( obj-at p986 l000-000 )
      ( obj-at p194 l000-000 )
      ( obj-at p969 l000-000 )
      ( obj-at p550 l000-000 )
      ( obj-at p915 l000-000 )
    )
  )
)
