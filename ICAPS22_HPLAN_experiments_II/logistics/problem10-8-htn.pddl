( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-210 - location
    l000-211 - location
    l000-452 - location
    l000-432 - location
    l000-179 - location
    l000-942 - location
    l000-168 - location
    l000-364 - location
    l000-612 - location
    l000-993 - location
    p249 - obj
    p152 - obj
    p474 - obj
    p862 - obj
    p532 - obj
    p708 - obj
    p903 - obj
    p397 - obj
    p351 - obj
    p303 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-210 c000 )
    ( in-city l000-211 c000 )
    ( in-city l000-452 c000 )
    ( in-city l000-432 c000 )
    ( in-city l000-179 c000 )
    ( in-city l000-942 c000 )
    ( in-city l000-168 c000 )
    ( in-city l000-364 c000 )
    ( in-city l000-612 c000 )
    ( in-city l000-993 c000 )
    ( obj-at p249 l000-993 )
    ( obj-at p152 l000-452 )
    ( obj-at p474 l000-612 )
    ( obj-at p862 l000-612 )
    ( obj-at p532 l000-364 )
    ( obj-at p708 l000-210 )
    ( obj-at p903 l000-364 )
    ( obj-at p397 l000-452 )
    ( obj-at p351 l000-179 )
    ( obj-at p303 l000-993 )
  )
  ( :tasks
    ( Deliver-10Pkg p249 p152 p474 p862 p532 p708 p903 p397 p351 p303 l000-000 )
  )
)
