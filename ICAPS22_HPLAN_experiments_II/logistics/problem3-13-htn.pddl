( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-389 - location
    l000-515 - location
    l000-826 - location
    l000-330 - location
    l000-535 - location
    p699 - obj
    p647 - obj
    p714 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-389 c000 )
    ( in-city l000-515 c000 )
    ( in-city l000-826 c000 )
    ( in-city l000-330 c000 )
    ( in-city l000-535 c000 )
    ( obj-at p699 l000-389 )
    ( obj-at p647 l000-826 )
    ( obj-at p714 l000-389 )
  )
  ( :tasks
    ( Deliver-3Pkg p699 p647 p714 l000-000 )
  )
)
