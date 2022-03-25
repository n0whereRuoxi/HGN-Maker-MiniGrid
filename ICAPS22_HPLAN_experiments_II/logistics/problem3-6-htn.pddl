( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-495 - location
    l000-122 - location
    l000-674 - location
    p783 - obj
    p561 - obj
    p333 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-495 c000 )
    ( in-city l000-122 c000 )
    ( in-city l000-674 c000 )
    ( obj-at p783 l000-495 )
    ( obj-at p561 l000-122 )
    ( obj-at p333 l000-495 )
  )
  ( :tasks
    ( Deliver-3Pkg p783 p561 p333 l000-000 )
  )
)
