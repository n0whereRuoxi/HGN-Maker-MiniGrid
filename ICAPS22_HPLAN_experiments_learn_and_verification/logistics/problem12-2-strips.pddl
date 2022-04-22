( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-181 - location
    l000-875 - location
    l000-184 - location
    l000-382 - location
    l000-725 - location
    l000-838 - location
    p852 - obj
    p998 - obj
    p389 - obj
    p603 - obj
    p854 - obj
    p67 - obj
    p434 - obj
    p874 - obj
    p202 - obj
    p96 - obj
    p23 - obj
    p525 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-181 c000 )
    ( in-city l000-875 c000 )
    ( in-city l000-184 c000 )
    ( in-city l000-382 c000 )
    ( in-city l000-725 c000 )
    ( in-city l000-838 c000 )
    ( obj-at p852 l000-382 )
    ( obj-at p998 l000-184 )
    ( obj-at p389 l000-184 )
    ( obj-at p603 l000-725 )
    ( obj-at p854 l000-838 )
    ( obj-at p67 l000-725 )
    ( obj-at p434 l000-838 )
    ( obj-at p874 l000-838 )
    ( obj-at p202 l000-725 )
    ( obj-at p96 l000-725 )
    ( obj-at p23 l000-184 )
    ( obj-at p525 l000-184 )
  )
  ( :goal
    ( and
      ( obj-at p852 l000-000 )
      ( obj-at p998 l000-000 )
      ( obj-at p389 l000-000 )
      ( obj-at p603 l000-000 )
      ( obj-at p854 l000-000 )
      ( obj-at p67 l000-000 )
      ( obj-at p434 l000-000 )
      ( obj-at p874 l000-000 )
      ( obj-at p202 l000-000 )
      ( obj-at p96 l000-000 )
      ( obj-at p23 l000-000 )
      ( obj-at p525 l000-000 )
    )
  )
)
