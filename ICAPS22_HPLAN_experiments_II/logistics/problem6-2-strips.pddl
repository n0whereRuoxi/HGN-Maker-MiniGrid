( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-848 - location
    l000-197 - location
    l000-899 - location
    l000-823 - location
    l000-649 - location
    l000-622 - location
    l000-614 - location
    p790 - obj
    p240 - obj
    p953 - obj
    p179 - obj
    p661 - obj
    p776 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-848 c000 )
    ( in-city l000-197 c000 )
    ( in-city l000-899 c000 )
    ( in-city l000-823 c000 )
    ( in-city l000-649 c000 )
    ( in-city l000-622 c000 )
    ( in-city l000-614 c000 )
    ( obj-at p790 l000-823 )
    ( obj-at p240 l000-649 )
    ( obj-at p953 l000-197 )
    ( obj-at p179 l000-197 )
    ( obj-at p661 l000-197 )
    ( obj-at p776 l000-622 )
  )
  ( :goal
    ( and
      ( obj-at p790 l000-000 )
      ( obj-at p240 l000-000 )
      ( obj-at p953 l000-000 )
      ( obj-at p179 l000-000 )
      ( obj-at p661 l000-000 )
      ( obj-at p776 l000-000 )
    )
  )
)
