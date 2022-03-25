( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-530 - location
    l000-837 - location
    l000-598 - location
    l000-425 - location
    l000-12 - location
    p817 - obj
    p230 - obj
    p848 - obj
    p97 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-530 c000 )
    ( in-city l000-837 c000 )
    ( in-city l000-598 c000 )
    ( in-city l000-425 c000 )
    ( in-city l000-12 c000 )
    ( obj-at p817 l000-530 )
    ( obj-at p230 l000-12 )
    ( obj-at p848 l000-425 )
    ( obj-at p97 l000-837 )
  )
  ( :tasks
    ( Deliver-4Pkg p817 p230 p848 p97 l000-000 )
  )
)
