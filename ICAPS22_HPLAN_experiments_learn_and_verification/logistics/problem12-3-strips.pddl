( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-638 - location
    l000-91 - location
    l000-128 - location
    l000-643 - location
    l000-521 - location
    l000-348 - location
    l000-158 - location
    l000-3 - location
    l000-760 - location
    l000-468 - location
    l000-354 - location
    p607 - obj
    p424 - obj
    p632 - obj
    p306 - obj
    p455 - obj
    p521 - obj
    p843 - obj
    p922 - obj
    p468 - obj
    p702 - obj
    p487 - obj
    p241 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-638 c000 )
    ( in-city l000-91 c000 )
    ( in-city l000-128 c000 )
    ( in-city l000-643 c000 )
    ( in-city l000-521 c000 )
    ( in-city l000-348 c000 )
    ( in-city l000-158 c000 )
    ( in-city l000-3 c000 )
    ( in-city l000-760 c000 )
    ( in-city l000-468 c000 )
    ( in-city l000-354 c000 )
    ( obj-at p607 l000-158 )
    ( obj-at p424 l000-3 )
    ( obj-at p632 l000-638 )
    ( obj-at p306 l000-348 )
    ( obj-at p455 l000-638 )
    ( obj-at p521 l000-643 )
    ( obj-at p843 l000-468 )
    ( obj-at p922 l000-521 )
    ( obj-at p468 l000-354 )
    ( obj-at p702 l000-521 )
    ( obj-at p487 l000-354 )
    ( obj-at p241 l000-91 )
  )
  ( :goal
    ( and
      ( obj-at p607 l000-000 )
      ( obj-at p424 l000-000 )
      ( obj-at p632 l000-000 )
      ( obj-at p306 l000-000 )
      ( obj-at p455 l000-000 )
      ( obj-at p521 l000-000 )
      ( obj-at p843 l000-000 )
      ( obj-at p922 l000-000 )
      ( obj-at p468 l000-000 )
      ( obj-at p702 l000-000 )
      ( obj-at p487 l000-000 )
      ( obj-at p241 l000-000 )
    )
  )
)
