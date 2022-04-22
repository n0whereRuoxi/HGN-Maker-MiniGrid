( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-461 - location
    l000-338 - location
    l000-852 - location
    l000-460 - location
    l000-669 - location
    l000-582 - location
    l000-760 - location
    l000-512 - location
    p696 - obj
    p8 - obj
    p50 - obj
    p89 - obj
    p805 - obj
    p748 - obj
    p358 - obj
    p305 - obj
    p685 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-461 c000 )
    ( in-city l000-338 c000 )
    ( in-city l000-852 c000 )
    ( in-city l000-460 c000 )
    ( in-city l000-669 c000 )
    ( in-city l000-582 c000 )
    ( in-city l000-760 c000 )
    ( in-city l000-512 c000 )
    ( obj-at p696 l000-669 )
    ( obj-at p8 l000-461 )
    ( obj-at p50 l000-852 )
    ( obj-at p89 l000-852 )
    ( obj-at p805 l000-461 )
    ( obj-at p748 l000-512 )
    ( obj-at p358 l000-460 )
    ( obj-at p305 l000-760 )
    ( obj-at p685 l000-512 )
  )
  ( :goal
    ( and
      ( obj-at p696 l000-000 )
      ( obj-at p8 l000-000 )
      ( obj-at p50 l000-000 )
      ( obj-at p89 l000-000 )
      ( obj-at p805 l000-000 )
      ( obj-at p748 l000-000 )
      ( obj-at p358 l000-000 )
      ( obj-at p305 l000-000 )
      ( obj-at p685 l000-000 )
    )
  )
)
