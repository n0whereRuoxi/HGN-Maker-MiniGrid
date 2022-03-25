( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-108 - location
    l000-95 - location
    l000-962 - location
    l000-298 - location
    l000-966 - location
    l000-462 - location
    l000-274 - location
    l000-241 - location
    l000-809 - location
    l000-875 - location
    l000-290 - location
    l000-70 - location
    l000-539 - location
    l000-96 - location
    p780 - obj
    p505 - obj
    p503 - obj
    p938 - obj
    p724 - obj
    p902 - obj
    p16 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-108 c000 )
    ( in-city l000-95 c000 )
    ( in-city l000-962 c000 )
    ( in-city l000-298 c000 )
    ( in-city l000-966 c000 )
    ( in-city l000-462 c000 )
    ( in-city l000-274 c000 )
    ( in-city l000-241 c000 )
    ( in-city l000-809 c000 )
    ( in-city l000-875 c000 )
    ( in-city l000-290 c000 )
    ( in-city l000-70 c000 )
    ( in-city l000-539 c000 )
    ( in-city l000-96 c000 )
    ( obj-at p780 l000-96 )
    ( obj-at p505 l000-290 )
    ( obj-at p503 l000-462 )
    ( obj-at p938 l000-95 )
    ( obj-at p724 l000-108 )
    ( obj-at p902 l000-274 )
    ( obj-at p16 l000-962 )
  )
  ( :tasks
    ( Deliver-7Pkg p780 p505 p503 p938 p724 p902 p16 l000-000 )
  )
)
