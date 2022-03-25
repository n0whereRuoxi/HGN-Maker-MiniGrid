( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-276 - location
    l000-251 - location
    l000-208 - location
    l000-354 - location
    l000-760 - location
    l000-510 - location
    l000-883 - location
    l000-91 - location
    l000-405 - location
    l000-261 - location
    l000-770 - location
    l000-612 - location
    l000-426 - location
    p485 - obj
    p249 - obj
    p341 - obj
    p506 - obj
    p34 - obj
    p65 - obj
    p313 - obj
    p310 - obj
    p959 - obj
    p93 - obj
    p804 - obj
    p725 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-276 c000 )
    ( in-city l000-251 c000 )
    ( in-city l000-208 c000 )
    ( in-city l000-354 c000 )
    ( in-city l000-760 c000 )
    ( in-city l000-510 c000 )
    ( in-city l000-883 c000 )
    ( in-city l000-91 c000 )
    ( in-city l000-405 c000 )
    ( in-city l000-261 c000 )
    ( in-city l000-770 c000 )
    ( in-city l000-612 c000 )
    ( in-city l000-426 c000 )
    ( obj-at p485 l000-612 )
    ( obj-at p249 l000-276 )
    ( obj-at p341 l000-276 )
    ( obj-at p506 l000-405 )
    ( obj-at p34 l000-883 )
    ( obj-at p65 l000-405 )
    ( obj-at p313 l000-251 )
    ( obj-at p310 l000-405 )
    ( obj-at p959 l000-510 )
    ( obj-at p93 l000-276 )
    ( obj-at p804 l000-612 )
    ( obj-at p725 l000-770 )
  )
  ( :tasks
    ( Deliver-12Pkg p485 p249 p341 p506 p34 p65 p313 p310 p959 p93 p804 p725 l000-000 )
  )
)
