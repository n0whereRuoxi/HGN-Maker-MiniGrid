( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-29 - location
    l000-722 - location
    l000-74 - location
    l000-505 - location
    l000-640 - location
    l000-274 - location
    l000-982 - location
    l000-507 - location
    l000-855 - location
    l000-52 - location
    l000-414 - location
    l000-687 - location
    l000-150 - location
    l000-825 - location
    p403 - obj
    p171 - obj
    p944 - obj
    p909 - obj
    p702 - obj
    p529 - obj
    p10 - obj
    p946 - obj
    p838 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-29 c000 )
    ( in-city l000-722 c000 )
    ( in-city l000-74 c000 )
    ( in-city l000-505 c000 )
    ( in-city l000-640 c000 )
    ( in-city l000-274 c000 )
    ( in-city l000-982 c000 )
    ( in-city l000-507 c000 )
    ( in-city l000-855 c000 )
    ( in-city l000-52 c000 )
    ( in-city l000-414 c000 )
    ( in-city l000-687 c000 )
    ( in-city l000-150 c000 )
    ( in-city l000-825 c000 )
    ( obj-at p403 l000-687 )
    ( obj-at p171 l000-74 )
    ( obj-at p944 l000-74 )
    ( obj-at p909 l000-150 )
    ( obj-at p702 l000-414 )
    ( obj-at p529 l000-825 )
    ( obj-at p10 l000-505 )
    ( obj-at p946 l000-414 )
    ( obj-at p838 l000-982 )
  )
  ( :tasks
    ( Deliver-9Pkg p403 p171 p944 p909 p702 p529 p10 p946 p838 l000-000 )
  )
)
