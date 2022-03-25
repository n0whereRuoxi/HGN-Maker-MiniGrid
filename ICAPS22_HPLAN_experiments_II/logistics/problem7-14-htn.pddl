( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-38 - location
    l000-339 - location
    l000-139 - location
    l000-910 - location
    l000-832 - location
    l000-663 - location
    l000-289 - location
    l000-324 - location
    l000-59 - location
    p184 - obj
    p689 - obj
    p607 - obj
    p461 - obj
    p946 - obj
    p454 - obj
    p666 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-38 c000 )
    ( in-city l000-339 c000 )
    ( in-city l000-139 c000 )
    ( in-city l000-910 c000 )
    ( in-city l000-832 c000 )
    ( in-city l000-663 c000 )
    ( in-city l000-289 c000 )
    ( in-city l000-324 c000 )
    ( in-city l000-59 c000 )
    ( obj-at p184 l000-59 )
    ( obj-at p689 l000-139 )
    ( obj-at p607 l000-832 )
    ( obj-at p461 l000-910 )
    ( obj-at p946 l000-663 )
    ( obj-at p454 l000-324 )
    ( obj-at p666 l000-324 )
  )
  ( :tasks
    ( Deliver-7Pkg p184 p689 p607 p461 p946 p454 p666 l000-000 )
  )
)
