( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-41 - location
    l000-570 - location
    l000-890 - location
    l000-549 - location
    l000-785 - location
    l000-982 - location
    l000-94 - location
    l000-577 - location
    l000-845 - location
    l000-489 - location
    l000-708 - location
    p544 - obj
    p277 - obj
    p500 - obj
    p221 - obj
    p244 - obj
    p108 - obj
    p694 - obj
    p346 - obj
    p913 - obj
    p985 - obj
    p357 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-41 c000 )
    ( in-city l000-570 c000 )
    ( in-city l000-890 c000 )
    ( in-city l000-549 c000 )
    ( in-city l000-785 c000 )
    ( in-city l000-982 c000 )
    ( in-city l000-94 c000 )
    ( in-city l000-577 c000 )
    ( in-city l000-845 c000 )
    ( in-city l000-489 c000 )
    ( in-city l000-708 c000 )
    ( obj-at p544 l000-577 )
    ( obj-at p277 l000-577 )
    ( obj-at p500 l000-982 )
    ( obj-at p221 l000-41 )
    ( obj-at p244 l000-890 )
    ( obj-at p108 l000-570 )
    ( obj-at p694 l000-708 )
    ( obj-at p346 l000-890 )
    ( obj-at p913 l000-549 )
    ( obj-at p985 l000-570 )
    ( obj-at p357 l000-577 )
  )
  ( :tasks
    ( Deliver-11Pkg p544 p277 p500 p221 p244 p108 p694 p346 p913 p985 p357 l000-000 )
  )
)
