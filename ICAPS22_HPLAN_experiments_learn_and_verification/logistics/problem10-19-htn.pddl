( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-245 - location
    l000-972 - location
    l000-124 - location
    l000-227 - location
    l000-633 - location
    l000-86 - location
    l000-152 - location
    l000-809 - location
    l000-700 - location
    l000-821 - location
    l000-849 - location
    l000-953 - location
    l000-569 - location
    l000-886 - location
    l000-760 - location
    l000-429 - location
    l000-31 - location
    l000-528 - location
    l000-186 - location
    l000-85 - location
    p408 - obj
    p703 - obj
    p878 - obj
    p100 - obj
    p366 - obj
    p722 - obj
    p814 - obj
    p437 - obj
    p130 - obj
    p697 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-245 c000 )
    ( in-city l000-972 c000 )
    ( in-city l000-124 c000 )
    ( in-city l000-227 c000 )
    ( in-city l000-633 c000 )
    ( in-city l000-86 c000 )
    ( in-city l000-152 c000 )
    ( in-city l000-809 c000 )
    ( in-city l000-700 c000 )
    ( in-city l000-821 c000 )
    ( in-city l000-849 c000 )
    ( in-city l000-953 c000 )
    ( in-city l000-569 c000 )
    ( in-city l000-886 c000 )
    ( in-city l000-760 c000 )
    ( in-city l000-429 c000 )
    ( in-city l000-31 c000 )
    ( in-city l000-528 c000 )
    ( in-city l000-186 c000 )
    ( in-city l000-85 c000 )
    ( obj-at p408 l000-429 )
    ( obj-at p703 l000-760 )
    ( obj-at p878 l000-31 )
    ( obj-at p100 l000-245 )
    ( obj-at p366 l000-152 )
    ( obj-at p722 l000-85 )
    ( obj-at p814 l000-86 )
    ( obj-at p437 l000-972 )
    ( obj-at p130 l000-633 )
    ( obj-at p697 l000-821 )
  )
  ( :tasks
    ( Deliver-10Pkg p408 p703 p878 p100 p366 p722 p814 p437 p130 p697 l000-000 )
  )
)
