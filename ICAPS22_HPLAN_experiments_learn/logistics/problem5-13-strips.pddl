( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-755 - location
    l000-84 - location
    l000-792 - location
    l000-406 - location
    p637 - obj
    p522 - obj
    p845 - obj
    p417 - obj
    p175 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-755 c000 )
    ( in-city l000-84 c000 )
    ( in-city l000-792 c000 )
    ( in-city l000-406 c000 )
    ( obj-at p637 l000-755 )
    ( obj-at p522 l000-792 )
    ( obj-at p845 l000-755 )
    ( obj-at p417 l000-755 )
    ( obj-at p175 l000-755 )
  )
  ( :goal
    ( and
      ( obj-at p637 l000-000 )
      ( obj-at p522 l000-000 )
      ( obj-at p845 l000-000 )
      ( obj-at p417 l000-000 )
      ( obj-at p175 l000-000 )
    )
  )
)
