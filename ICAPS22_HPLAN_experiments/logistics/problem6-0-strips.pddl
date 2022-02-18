( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-778 - location
    l000-845 - location
    l000-823 - location
    l000-331 - location
    l000-945 - location
    p805 - obj
    p349 - obj
    p280 - obj
    p530 - obj
    p776 - obj
    p821 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-778 c000 )
    ( in-city l000-845 c000 )
    ( in-city l000-823 c000 )
    ( in-city l000-331 c000 )
    ( in-city l000-945 c000 )
    ( obj-at p805 l000-823 )
    ( obj-at p349 l000-331 )
    ( obj-at p280 l000-945 )
    ( obj-at p530 l000-845 )
    ( obj-at p776 l000-778 )
    ( obj-at p821 l000-945 )
  )
  ( :goal
    ( and
      ( obj-at p805 l000-000 )
      ( obj-at p349 l000-000 )
      ( obj-at p280 l000-000 )
      ( obj-at p530 l000-000 )
      ( obj-at p776 l000-000 )
      ( obj-at p821 l000-000 )
    )
  )
)
