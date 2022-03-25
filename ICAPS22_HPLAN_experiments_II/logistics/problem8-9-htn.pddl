( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-861 - location
    l000-120 - location
    l000-463 - location
    l000-408 - location
    l000-194 - location
    l000-685 - location
    l000-595 - location
    l000-256 - location
    l000-669 - location
    p366 - obj
    p490 - obj
    p653 - obj
    p931 - obj
    p880 - obj
    p320 - obj
    p772 - obj
    p200 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-861 c000 )
    ( in-city l000-120 c000 )
    ( in-city l000-463 c000 )
    ( in-city l000-408 c000 )
    ( in-city l000-194 c000 )
    ( in-city l000-685 c000 )
    ( in-city l000-595 c000 )
    ( in-city l000-256 c000 )
    ( in-city l000-669 c000 )
    ( obj-at p366 l000-669 )
    ( obj-at p490 l000-685 )
    ( obj-at p653 l000-669 )
    ( obj-at p931 l000-685 )
    ( obj-at p880 l000-861 )
    ( obj-at p320 l000-685 )
    ( obj-at p772 l000-256 )
    ( obj-at p200 l000-861 )
  )
  ( :tasks
    ( Deliver-8Pkg p366 p490 p653 p931 p880 p320 p772 p200 l000-000 )
  )
)
