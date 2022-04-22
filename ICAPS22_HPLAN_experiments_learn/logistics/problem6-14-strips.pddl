( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-298 - location
    l000-323 - location
    l000-875 - location
    p175 - obj
    p522 - obj
    p844 - obj
    p852 - obj
    p189 - obj
    p793 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-298 c000 )
    ( in-city l000-323 c000 )
    ( in-city l000-875 c000 )
    ( obj-at p175 l000-875 )
    ( obj-at p522 l000-875 )
    ( obj-at p844 l000-298 )
    ( obj-at p852 l000-875 )
    ( obj-at p189 l000-323 )
    ( obj-at p793 l000-323 )
  )
  ( :goal
    ( and
      ( obj-at p175 l000-000 )
      ( obj-at p522 l000-000 )
      ( obj-at p844 l000-000 )
      ( obj-at p852 l000-000 )
      ( obj-at p189 l000-000 )
      ( obj-at p793 l000-000 )
    )
  )
)
