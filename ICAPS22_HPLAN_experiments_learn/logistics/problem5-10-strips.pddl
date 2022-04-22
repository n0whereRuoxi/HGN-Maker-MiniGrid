( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-430 - location
    l000-66 - location
    l000-129 - location
    l000-945 - location
    l000-533 - location
    l000-935 - location
    l000-255 - location
    l000-485 - location
    l000-395 - location
    p219 - obj
    p715 - obj
    p659 - obj
    p927 - obj
    p475 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-430 c000 )
    ( in-city l000-66 c000 )
    ( in-city l000-129 c000 )
    ( in-city l000-945 c000 )
    ( in-city l000-533 c000 )
    ( in-city l000-935 c000 )
    ( in-city l000-255 c000 )
    ( in-city l000-485 c000 )
    ( in-city l000-395 c000 )
    ( obj-at p219 l000-129 )
    ( obj-at p715 l000-129 )
    ( obj-at p659 l000-430 )
    ( obj-at p927 l000-395 )
    ( obj-at p475 l000-485 )
  )
  ( :goal
    ( and
      ( obj-at p219 l000-000 )
      ( obj-at p715 l000-000 )
      ( obj-at p659 l000-000 )
      ( obj-at p927 l000-000 )
      ( obj-at p475 l000-000 )
    )
  )
)
