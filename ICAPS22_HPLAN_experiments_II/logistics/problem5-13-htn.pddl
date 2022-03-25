( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-89 - location
    l000-975 - location
    l000-232 - location
    p667 - obj
    p311 - obj
    p854 - obj
    p969 - obj
    p141 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-89 c000 )
    ( in-city l000-975 c000 )
    ( in-city l000-232 c000 )
    ( obj-at p667 l000-232 )
    ( obj-at p311 l000-89 )
    ( obj-at p854 l000-975 )
    ( obj-at p969 l000-89 )
    ( obj-at p141 l000-89 )
  )
  ( :tasks
    ( Deliver-5Pkg p667 p311 p854 p969 p141 l000-000 )
  )
)
