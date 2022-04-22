( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-164 - location
    l000-773 - location
    l000-391 - location
    l000-466 - location
    l000-304 - location
    l000-4 - location
    l000-197 - location
    l000-736 - location
    l000-762 - location
    l000-853 - location
    p375 - obj
    p847 - obj
    p570 - obj
    p2 - obj
    p718 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-164 c000 )
    ( in-city l000-773 c000 )
    ( in-city l000-391 c000 )
    ( in-city l000-466 c000 )
    ( in-city l000-304 c000 )
    ( in-city l000-4 c000 )
    ( in-city l000-197 c000 )
    ( in-city l000-736 c000 )
    ( in-city l000-762 c000 )
    ( in-city l000-853 c000 )
    ( obj-at p375 l000-762 )
    ( obj-at p847 l000-736 )
    ( obj-at p570 l000-304 )
    ( obj-at p2 l000-164 )
    ( obj-at p718 l000-853 )
  )
  ( :tasks
    ( Deliver-5Pkg p375 p847 p570 p2 p718 l000-000 )
  )
)
