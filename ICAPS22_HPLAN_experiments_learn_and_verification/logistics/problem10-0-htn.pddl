( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-501 - location
    l000-626 - location
    l000-772 - location
    l000-98 - location
    l000-418 - location
    l000-416 - location
    l000-390 - location
    l000-18 - location
    l000-459 - location
    l000-841 - location
    l000-45 - location
    l000-513 - location
    l000-792 - location
    l000-234 - location
    l000-871 - location
    l000-165 - location
    p251 - obj
    p548 - obj
    p307 - obj
    p503 - obj
    p753 - obj
    p270 - obj
    p146 - obj
    p958 - obj
    p17 - obj
    p813 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-501 c000 )
    ( in-city l000-626 c000 )
    ( in-city l000-772 c000 )
    ( in-city l000-98 c000 )
    ( in-city l000-418 c000 )
    ( in-city l000-416 c000 )
    ( in-city l000-390 c000 )
    ( in-city l000-18 c000 )
    ( in-city l000-459 c000 )
    ( in-city l000-841 c000 )
    ( in-city l000-45 c000 )
    ( in-city l000-513 c000 )
    ( in-city l000-792 c000 )
    ( in-city l000-234 c000 )
    ( in-city l000-871 c000 )
    ( in-city l000-165 c000 )
    ( obj-at p251 l000-626 )
    ( obj-at p548 l000-459 )
    ( obj-at p307 l000-416 )
    ( obj-at p503 l000-98 )
    ( obj-at p753 l000-459 )
    ( obj-at p270 l000-18 )
    ( obj-at p146 l000-513 )
    ( obj-at p958 l000-501 )
    ( obj-at p17 l000-459 )
    ( obj-at p813 l000-501 )
  )
  ( :tasks
    ( Deliver-10Pkg p251 p548 p307 p503 p753 p270 p146 p958 p17 p813 l000-000 )
  )
)
