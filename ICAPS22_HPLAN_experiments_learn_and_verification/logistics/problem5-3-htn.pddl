( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-607 - location
    l000-802 - location
    l000-11 - location
    l000-97 - location
    l000-890 - location
    l000-645 - location
    l000-963 - location
    l000-493 - location
    l000-95 - location
    p506 - obj
    p870 - obj
    p564 - obj
    p932 - obj
    p15 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-607 c000 )
    ( in-city l000-802 c000 )
    ( in-city l000-11 c000 )
    ( in-city l000-97 c000 )
    ( in-city l000-890 c000 )
    ( in-city l000-645 c000 )
    ( in-city l000-963 c000 )
    ( in-city l000-493 c000 )
    ( in-city l000-95 c000 )
    ( obj-at p506 l000-607 )
    ( obj-at p870 l000-802 )
    ( obj-at p564 l000-890 )
    ( obj-at p932 l000-963 )
    ( obj-at p15 l000-802 )
  )
  ( :tasks
    ( Deliver-5Pkg p506 p870 p564 p932 p15 l000-000 )
  )
)
