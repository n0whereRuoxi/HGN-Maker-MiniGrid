( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-810 - location
    l000-166 - location
    l000-964 - location
    l000-485 - location
    l000-502 - location
    l000-761 - location
    l000-925 - location
    l000-822 - location
    l000-720 - location
    p946 - obj
    p463 - obj
    p776 - obj
    p379 - obj
    p966 - obj
    p208 - obj
    p573 - obj
    p847 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-810 c000 )
    ( in-city l000-166 c000 )
    ( in-city l000-964 c000 )
    ( in-city l000-485 c000 )
    ( in-city l000-502 c000 )
    ( in-city l000-761 c000 )
    ( in-city l000-925 c000 )
    ( in-city l000-822 c000 )
    ( in-city l000-720 c000 )
    ( obj-at p946 l000-502 )
    ( obj-at p463 l000-761 )
    ( obj-at p776 l000-720 )
    ( obj-at p379 l000-166 )
    ( obj-at p966 l000-810 )
    ( obj-at p208 l000-822 )
    ( obj-at p573 l000-720 )
    ( obj-at p847 l000-964 )
  )
  ( :tasks
    ( Deliver-8Pkg p946 p463 p776 p379 p966 p208 p573 p847 l000-000 )
  )
)
