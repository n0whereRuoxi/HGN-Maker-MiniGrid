( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-918 - location
    l000-940 - location
    l000-329 - location
    l000-326 - location
    l000-650 - location
    l000-363 - location
    l000-684 - location
    p701 - obj
    p861 - obj
    p618 - obj
    p369 - obj
    p930 - obj
    p937 - obj
    p409 - obj
    p916 - obj
    p870 - obj
    p417 - obj
    p146 - obj
    p211 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-918 c000 )
    ( in-city l000-940 c000 )
    ( in-city l000-329 c000 )
    ( in-city l000-326 c000 )
    ( in-city l000-650 c000 )
    ( in-city l000-363 c000 )
    ( in-city l000-684 c000 )
    ( obj-at p701 l000-329 )
    ( obj-at p861 l000-326 )
    ( obj-at p618 l000-918 )
    ( obj-at p369 l000-329 )
    ( obj-at p930 l000-684 )
    ( obj-at p937 l000-329 )
    ( obj-at p409 l000-684 )
    ( obj-at p916 l000-650 )
    ( obj-at p870 l000-329 )
    ( obj-at p417 l000-329 )
    ( obj-at p146 l000-684 )
    ( obj-at p211 l000-363 )
  )
  ( :tasks
    ( Deliver-12Pkg p701 p861 p618 p369 p930 p937 p409 p916 p870 p417 p146 p211 l000-000 )
  )
)
