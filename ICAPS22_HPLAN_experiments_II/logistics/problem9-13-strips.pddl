( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-248 - location
    l000-669 - location
    l000-530 - location
    l000-482 - location
    l000-502 - location
    l000-865 - location
    l000-61 - location
    l000-783 - location
    l000-491 - location
    l000-521 - location
    l000-593 - location
    p527 - obj
    p584 - obj
    p780 - obj
    p3 - obj
    p158 - obj
    p68 - obj
    p240 - obj
    p334 - obj
    p744 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-248 c000 )
    ( in-city l000-669 c000 )
    ( in-city l000-530 c000 )
    ( in-city l000-482 c000 )
    ( in-city l000-502 c000 )
    ( in-city l000-865 c000 )
    ( in-city l000-61 c000 )
    ( in-city l000-783 c000 )
    ( in-city l000-491 c000 )
    ( in-city l000-521 c000 )
    ( in-city l000-593 c000 )
    ( obj-at p527 l000-593 )
    ( obj-at p584 l000-482 )
    ( obj-at p780 l000-593 )
    ( obj-at p3 l000-248 )
    ( obj-at p158 l000-530 )
    ( obj-at p68 l000-593 )
    ( obj-at p240 l000-502 )
    ( obj-at p334 l000-482 )
    ( obj-at p744 l000-248 )
  )
  ( :goal
    ( and
      ( obj-at p527 l000-000 )
      ( obj-at p584 l000-000 )
      ( obj-at p780 l000-000 )
      ( obj-at p3 l000-000 )
      ( obj-at p158 l000-000 )
      ( obj-at p68 l000-000 )
      ( obj-at p240 l000-000 )
      ( obj-at p334 l000-000 )
      ( obj-at p744 l000-000 )
    )
  )
)
