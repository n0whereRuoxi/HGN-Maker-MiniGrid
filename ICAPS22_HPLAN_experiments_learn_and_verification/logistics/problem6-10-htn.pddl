( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-843 - location
    l000-995 - location
    l000-685 - location
    l000-622 - location
    l000-646 - location
    l000-721 - location
    l000-225 - location
    l000-274 - location
    l000-215 - location
    l000-339 - location
    l000-396 - location
    l000-51 - location
    p620 - obj
    p659 - obj
    p798 - obj
    p889 - obj
    p268 - obj
    p171 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-843 c000 )
    ( in-city l000-995 c000 )
    ( in-city l000-685 c000 )
    ( in-city l000-622 c000 )
    ( in-city l000-646 c000 )
    ( in-city l000-721 c000 )
    ( in-city l000-225 c000 )
    ( in-city l000-274 c000 )
    ( in-city l000-215 c000 )
    ( in-city l000-339 c000 )
    ( in-city l000-396 c000 )
    ( in-city l000-51 c000 )
    ( obj-at p620 l000-843 )
    ( obj-at p659 l000-721 )
    ( obj-at p798 l000-622 )
    ( obj-at p889 l000-685 )
    ( obj-at p268 l000-339 )
    ( obj-at p171 l000-646 )
  )
  ( :tasks
    ( Deliver-6Pkg p620 p659 p798 p889 p268 p171 l000-000 )
  )
)
