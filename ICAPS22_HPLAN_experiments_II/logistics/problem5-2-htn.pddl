( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-155 - location
    l000-481 - location
    l000-229 - location
    l000-418 - location
    l000-779 - location
    l000-243 - location
    p849 - obj
    p609 - obj
    p551 - obj
    p594 - obj
    p457 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-155 c000 )
    ( in-city l000-481 c000 )
    ( in-city l000-229 c000 )
    ( in-city l000-418 c000 )
    ( in-city l000-779 c000 )
    ( in-city l000-243 c000 )
    ( obj-at p849 l000-418 )
    ( obj-at p609 l000-243 )
    ( obj-at p551 l000-229 )
    ( obj-at p594 l000-229 )
    ( obj-at p457 l000-779 )
  )
  ( :tasks
    ( Deliver-5Pkg p849 p609 p551 p594 p457 l000-000 )
  )
)
