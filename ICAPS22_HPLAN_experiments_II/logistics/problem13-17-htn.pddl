( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-593 - location
    l000-163 - location
    l000-683 - location
    l000-691 - location
    l000-85 - location
    l000-236 - location
    l000-181 - location
    l000-306 - location
    l000-479 - location
    l000-389 - location
    l000-408 - location
    l000-944 - location
    l000-671 - location
    l000-841 - location
    l000-872 - location
    l000-663 - location
    l000-625 - location
    l000-928 - location
    l000-402 - location
    l000-78 - location
    l000-953 - location
    p809 - obj
    p454 - obj
    p452 - obj
    p380 - obj
    p75 - obj
    p79 - obj
    p778 - obj
    p760 - obj
    p927 - obj
    p489 - obj
    p222 - obj
    p39 - obj
    p591 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-593 c000 )
    ( in-city l000-163 c000 )
    ( in-city l000-683 c000 )
    ( in-city l000-691 c000 )
    ( in-city l000-85 c000 )
    ( in-city l000-236 c000 )
    ( in-city l000-181 c000 )
    ( in-city l000-306 c000 )
    ( in-city l000-479 c000 )
    ( in-city l000-389 c000 )
    ( in-city l000-408 c000 )
    ( in-city l000-944 c000 )
    ( in-city l000-671 c000 )
    ( in-city l000-841 c000 )
    ( in-city l000-872 c000 )
    ( in-city l000-663 c000 )
    ( in-city l000-625 c000 )
    ( in-city l000-928 c000 )
    ( in-city l000-402 c000 )
    ( in-city l000-78 c000 )
    ( in-city l000-953 c000 )
    ( obj-at p809 l000-306 )
    ( obj-at p454 l000-163 )
    ( obj-at p452 l000-872 )
    ( obj-at p380 l000-841 )
    ( obj-at p75 l000-663 )
    ( obj-at p79 l000-625 )
    ( obj-at p778 l000-683 )
    ( obj-at p760 l000-181 )
    ( obj-at p927 l000-872 )
    ( obj-at p489 l000-181 )
    ( obj-at p222 l000-236 )
    ( obj-at p39 l000-928 )
    ( obj-at p591 l000-663 )
  )
  ( :tasks
    ( Deliver-13Pkg p809 p454 p452 p380 p75 p79 p778 p760 p927 p489 p222 p39 p591 l000-000 )
  )
)
