( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-413 - location
    l000-290 - location
    l000-958 - location
    l000-307 - location
    l000-172 - location
    l000-214 - location
    l000-772 - location
    l000-928 - location
    p13 - obj
    p543 - obj
    p591 - obj
    p738 - obj
    p603 - obj
    p573 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-413 c000 )
    ( in-city l000-290 c000 )
    ( in-city l000-958 c000 )
    ( in-city l000-307 c000 )
    ( in-city l000-172 c000 )
    ( in-city l000-214 c000 )
    ( in-city l000-772 c000 )
    ( in-city l000-928 c000 )
    ( obj-at p13 l000-307 )
    ( obj-at p543 l000-307 )
    ( obj-at p591 l000-172 )
    ( obj-at p738 l000-214 )
    ( obj-at p603 l000-307 )
    ( obj-at p573 l000-772 )
  )
  ( :tasks
    ( Deliver-6Pkg p13 p543 p591 p738 p603 p573 l000-000 )
  )
)
