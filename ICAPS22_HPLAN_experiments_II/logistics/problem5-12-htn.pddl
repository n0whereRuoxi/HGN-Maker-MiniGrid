( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-897 - location
    l000-89 - location
    p690 - obj
    p840 - obj
    p875 - obj
    p679 - obj
    p436 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-897 c000 )
    ( in-city l000-89 c000 )
    ( obj-at p690 l000-897 )
    ( obj-at p840 l000-897 )
    ( obj-at p875 l000-897 )
    ( obj-at p679 l000-89 )
    ( obj-at p436 l000-89 )
  )
  ( :tasks
    ( Deliver-5Pkg p690 p840 p875 p679 p436 l000-000 )
  )
)
