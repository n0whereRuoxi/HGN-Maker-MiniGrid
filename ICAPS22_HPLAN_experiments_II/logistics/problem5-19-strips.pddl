( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-760 - location
    l000-463 - location
    l000-783 - location
    l000-948 - location
    l000-366 - location
    l000-946 - location
    l000-84 - location
    p570 - obj
    p772 - obj
    p993 - obj
    p219 - obj
    p424 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-760 c000 )
    ( in-city l000-463 c000 )
    ( in-city l000-783 c000 )
    ( in-city l000-948 c000 )
    ( in-city l000-366 c000 )
    ( in-city l000-946 c000 )
    ( in-city l000-84 c000 )
    ( obj-at p570 l000-463 )
    ( obj-at p772 l000-366 )
    ( obj-at p993 l000-783 )
    ( obj-at p219 l000-366 )
    ( obj-at p424 l000-783 )
  )
  ( :goal
    ( and
      ( obj-at p570 l000-000 )
      ( obj-at p772 l000-000 )
      ( obj-at p993 l000-000 )
      ( obj-at p219 l000-000 )
      ( obj-at p424 l000-000 )
    )
  )
)
