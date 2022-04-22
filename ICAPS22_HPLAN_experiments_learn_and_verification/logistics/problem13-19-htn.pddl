( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-378 - location
    l000-26 - location
    l000-686 - location
    l000-941 - location
    l000-52 - location
    l000-12 - location
    l000-738 - location
    l000-452 - location
    l000-286 - location
    l000-178 - location
    l000-640 - location
    l000-348 - location
    p143 - obj
    p246 - obj
    p559 - obj
    p69 - obj
    p969 - obj
    p654 - obj
    p677 - obj
    p204 - obj
    p460 - obj
    p171 - obj
    p591 - obj
    p950 - obj
    p178 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-378 c000 )
    ( in-city l000-26 c000 )
    ( in-city l000-686 c000 )
    ( in-city l000-941 c000 )
    ( in-city l000-52 c000 )
    ( in-city l000-12 c000 )
    ( in-city l000-738 c000 )
    ( in-city l000-452 c000 )
    ( in-city l000-286 c000 )
    ( in-city l000-178 c000 )
    ( in-city l000-640 c000 )
    ( in-city l000-348 c000 )
    ( obj-at p143 l000-640 )
    ( obj-at p246 l000-738 )
    ( obj-at p559 l000-12 )
    ( obj-at p69 l000-26 )
    ( obj-at p969 l000-686 )
    ( obj-at p654 l000-941 )
    ( obj-at p677 l000-26 )
    ( obj-at p204 l000-178 )
    ( obj-at p460 l000-26 )
    ( obj-at p171 l000-452 )
    ( obj-at p591 l000-286 )
    ( obj-at p950 l000-640 )
    ( obj-at p178 l000-640 )
  )
  ( :tasks
    ( Deliver-13Pkg p143 p246 p559 p69 p969 p654 p677 p204 p460 p171 p591 p950 p178 l000-000 )
  )
)
