( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-867 - location
    l000-742 - location
    l000-979 - location
    l000-267 - location
    l000-677 - location
    l000-879 - location
    p289 - obj
    p24 - obj
    p141 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-867 c000 )
    ( in-city l000-742 c000 )
    ( in-city l000-979 c000 )
    ( in-city l000-267 c000 )
    ( in-city l000-677 c000 )
    ( in-city l000-879 c000 )
    ( obj-at p289 l000-267 )
    ( obj-at p24 l000-979 )
    ( obj-at p141 l000-742 )
  )
  ( :tasks
    ( Deliver-3Pkg p289 p24 p141 l000-000 )
  )
)
