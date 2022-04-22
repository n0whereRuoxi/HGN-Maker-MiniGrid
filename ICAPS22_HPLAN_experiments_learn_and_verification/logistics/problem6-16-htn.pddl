( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-802 - location
    l000-504 - location
    l000-119 - location
    l000-678 - location
    l000-791 - location
    l000-847 - location
    l000-597 - location
    l000-8 - location
    l000-720 - location
    l000-7 - location
    l000-542 - location
    l000-937 - location
    p427 - obj
    p93 - obj
    p167 - obj
    p372 - obj
    p489 - obj
    p967 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-802 c000 )
    ( in-city l000-504 c000 )
    ( in-city l000-119 c000 )
    ( in-city l000-678 c000 )
    ( in-city l000-791 c000 )
    ( in-city l000-847 c000 )
    ( in-city l000-597 c000 )
    ( in-city l000-8 c000 )
    ( in-city l000-720 c000 )
    ( in-city l000-7 c000 )
    ( in-city l000-542 c000 )
    ( in-city l000-937 c000 )
    ( obj-at p427 l000-720 )
    ( obj-at p93 l000-791 )
    ( obj-at p167 l000-802 )
    ( obj-at p372 l000-7 )
    ( obj-at p489 l000-7 )
    ( obj-at p967 l000-937 )
  )
  ( :tasks
    ( Deliver-6Pkg p427 p93 p167 p372 p489 p967 l000-000 )
  )
)
