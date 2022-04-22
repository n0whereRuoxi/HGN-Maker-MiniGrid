( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-966 - location
    l000-815 - location
    l000-351 - location
    l000-80 - location
    l000-892 - location
    l000-924 - location
    p863 - obj
    p255 - obj
    p393 - obj
    p40 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-966 c000 )
    ( in-city l000-815 c000 )
    ( in-city l000-351 c000 )
    ( in-city l000-80 c000 )
    ( in-city l000-892 c000 )
    ( in-city l000-924 c000 )
    ( obj-at p863 l000-924 )
    ( obj-at p255 l000-80 )
    ( obj-at p393 l000-892 )
    ( obj-at p40 l000-924 )
  )
  ( :tasks
    ( Deliver-4Pkg p863 p255 p393 p40 l000-000 )
  )
)
