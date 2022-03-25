( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-302 - location
    l000-872 - location
    l000-42 - location
    p352 - obj
    p37 - obj
    p854 - obj
    p91 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-302 c000 )
    ( in-city l000-872 c000 )
    ( in-city l000-42 c000 )
    ( obj-at p352 l000-302 )
    ( obj-at p37 l000-872 )
    ( obj-at p854 l000-302 )
    ( obj-at p91 l000-42 )
  )
  ( :tasks
    ( Deliver-4Pkg p352 p37 p854 p91 l000-000 )
  )
)
