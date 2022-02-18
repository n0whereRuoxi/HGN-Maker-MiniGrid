( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-94 - location
    l000-221 - location
    l000-288 - location
    l000-755 - location
    l000-373 - location
    l000-252 - location
    l000-868 - location
    l000-526 - location
    p334 - obj
    p679 - obj
    p197 - obj
    p143 - obj
    p273 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-94 c000 )
    ( in-city l000-221 c000 )
    ( in-city l000-288 c000 )
    ( in-city l000-755 c000 )
    ( in-city l000-373 c000 )
    ( in-city l000-252 c000 )
    ( in-city l000-868 c000 )
    ( in-city l000-526 c000 )
    ( obj-at p334 l000-526 )
    ( obj-at p679 l000-94 )
    ( obj-at p197 l000-526 )
    ( obj-at p143 l000-221 )
    ( obj-at p273 l000-288 )
  )
  ( :goal
    ( and
      ( obj-at p334 l000-000 )
      ( obj-at p679 l000-000 )
      ( obj-at p197 l000-000 )
      ( obj-at p143 l000-000 )
      ( obj-at p273 l000-000 )
    )
  )
)
