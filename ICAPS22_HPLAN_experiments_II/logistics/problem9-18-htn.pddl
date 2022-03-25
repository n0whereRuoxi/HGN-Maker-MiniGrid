( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-263 - location
    l000-826 - location
    l000-911 - location
    l000-356 - location
    l000-391 - location
    l000-500 - location
    p975 - obj
    p464 - obj
    p366 - obj
    p346 - obj
    p641 - obj
    p311 - obj
    p823 - obj
    p290 - obj
    p419 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-263 c000 )
    ( in-city l000-826 c000 )
    ( in-city l000-911 c000 )
    ( in-city l000-356 c000 )
    ( in-city l000-391 c000 )
    ( in-city l000-500 c000 )
    ( obj-at p975 l000-263 )
    ( obj-at p464 l000-500 )
    ( obj-at p366 l000-263 )
    ( obj-at p346 l000-356 )
    ( obj-at p641 l000-911 )
    ( obj-at p311 l000-500 )
    ( obj-at p823 l000-391 )
    ( obj-at p290 l000-391 )
    ( obj-at p419 l000-356 )
  )
  ( :tasks
    ( Deliver-9Pkg p975 p464 p366 p346 p641 p311 p823 p290 p419 l000-000 )
  )
)
