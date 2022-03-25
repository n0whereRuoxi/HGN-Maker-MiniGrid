( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-874 - location
    l000-792 - location
    p966 - obj
    p311 - obj
    p591 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-874 c000 )
    ( in-city l000-792 c000 )
    ( obj-at p966 l000-874 )
    ( obj-at p311 l000-792 )
    ( obj-at p591 l000-874 )
  )
  ( :goal
    ( and
      ( obj-at p966 l000-000 )
      ( obj-at p311 l000-000 )
      ( obj-at p591 l000-000 )
    )
  )
)
