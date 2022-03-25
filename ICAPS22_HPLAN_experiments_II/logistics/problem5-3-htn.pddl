( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-118 - location
    l000-904 - location
    l000-751 - location
    l000-511 - location
    l000-538 - location
    l000-514 - location
    p618 - obj
    p349 - obj
    p185 - obj
    p12 - obj
    p741 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-118 c000 )
    ( in-city l000-904 c000 )
    ( in-city l000-751 c000 )
    ( in-city l000-511 c000 )
    ( in-city l000-538 c000 )
    ( in-city l000-514 c000 )
    ( obj-at p618 l000-751 )
    ( obj-at p349 l000-751 )
    ( obj-at p185 l000-904 )
    ( obj-at p12 l000-511 )
    ( obj-at p741 l000-118 )
  )
  ( :tasks
    ( Deliver-5Pkg p618 p349 p185 p12 p741 l000-000 )
  )
)
