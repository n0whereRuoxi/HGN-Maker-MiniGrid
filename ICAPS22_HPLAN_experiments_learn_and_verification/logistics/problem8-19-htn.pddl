( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-173 - location
    l000-700 - location
    l000-705 - location
    l000-807 - location
    l000-743 - location
    l000-919 - location
    l000-261 - location
    l000-741 - location
    l000-133 - location
    l000-505 - location
    p693 - obj
    p265 - obj
    p826 - obj
    p162 - obj
    p757 - obj
    p490 - obj
    p72 - obj
    p612 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-173 c000 )
    ( in-city l000-700 c000 )
    ( in-city l000-705 c000 )
    ( in-city l000-807 c000 )
    ( in-city l000-743 c000 )
    ( in-city l000-919 c000 )
    ( in-city l000-261 c000 )
    ( in-city l000-741 c000 )
    ( in-city l000-133 c000 )
    ( in-city l000-505 c000 )
    ( obj-at p693 l000-743 )
    ( obj-at p265 l000-743 )
    ( obj-at p826 l000-743 )
    ( obj-at p162 l000-743 )
    ( obj-at p757 l000-700 )
    ( obj-at p490 l000-705 )
    ( obj-at p72 l000-919 )
    ( obj-at p612 l000-919 )
  )
  ( :tasks
    ( Deliver-8Pkg p693 p265 p826 p162 p757 p490 p72 p612 l000-000 )
  )
)
