( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-298 - location
    l000-274 - location
    l000-891 - location
    l000-477 - location
    l000-79 - location
    l000-639 - location
    l000-68 - location
    p491 - obj
    p498 - obj
    p633 - obj
    p7 - obj
    p636 - obj
    p27 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-298 c000 )
    ( in-city l000-274 c000 )
    ( in-city l000-891 c000 )
    ( in-city l000-477 c000 )
    ( in-city l000-79 c000 )
    ( in-city l000-639 c000 )
    ( in-city l000-68 c000 )
    ( obj-at p491 l000-639 )
    ( obj-at p498 l000-298 )
    ( obj-at p633 l000-68 )
    ( obj-at p7 l000-891 )
    ( obj-at p636 l000-298 )
    ( obj-at p27 l000-298 )
  )
  ( :tasks
    ( Deliver-6Pkg p491 p498 p633 p7 p636 p27 l000-000 )
  )
)
