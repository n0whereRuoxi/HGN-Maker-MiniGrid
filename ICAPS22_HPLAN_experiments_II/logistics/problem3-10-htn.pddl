( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-100 - location
    l000-570 - location
    p126 - obj
    p751 - obj
    p200 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-100 c000 )
    ( in-city l000-570 c000 )
    ( obj-at p126 l000-570 )
    ( obj-at p751 l000-100 )
    ( obj-at p200 l000-100 )
  )
  ( :tasks
    ( Deliver-3Pkg p126 p751 p200 l000-000 )
  )
)
