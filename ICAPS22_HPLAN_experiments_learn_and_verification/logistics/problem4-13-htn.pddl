( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-838 - location
    l000-325 - location
    l000-294 - location
    l000-658 - location
    p587 - obj
    p299 - obj
    p33 - obj
    p40 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-838 c000 )
    ( in-city l000-325 c000 )
    ( in-city l000-294 c000 )
    ( in-city l000-658 c000 )
    ( obj-at p587 l000-325 )
    ( obj-at p299 l000-325 )
    ( obj-at p33 l000-325 )
    ( obj-at p40 l000-838 )
  )
  ( :tasks
    ( Deliver-4Pkg p587 p299 p33 p40 l000-000 )
  )
)
