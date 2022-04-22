( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-375 - location
    l000-485 - location
    l000-908 - location
    l000-53 - location
    l000-109 - location
    l000-583 - location
    l000-276 - location
    l000-995 - location
    l000-114 - location
    l000-918 - location
    l000-315 - location
    l000-769 - location
    l000-279 - location
    p815 - obj
    p748 - obj
    p556 - obj
    p498 - obj
    p315 - obj
    p57 - obj
    p267 - obj
    p855 - obj
    p417 - obj
    p835 - obj
    p700 - obj
    p710 - obj
    p726 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-375 c000 )
    ( in-city l000-485 c000 )
    ( in-city l000-908 c000 )
    ( in-city l000-53 c000 )
    ( in-city l000-109 c000 )
    ( in-city l000-583 c000 )
    ( in-city l000-276 c000 )
    ( in-city l000-995 c000 )
    ( in-city l000-114 c000 )
    ( in-city l000-918 c000 )
    ( in-city l000-315 c000 )
    ( in-city l000-769 c000 )
    ( in-city l000-279 c000 )
    ( obj-at p815 l000-769 )
    ( obj-at p748 l000-485 )
    ( obj-at p556 l000-53 )
    ( obj-at p498 l000-315 )
    ( obj-at p315 l000-375 )
    ( obj-at p57 l000-279 )
    ( obj-at p267 l000-375 )
    ( obj-at p855 l000-485 )
    ( obj-at p417 l000-279 )
    ( obj-at p835 l000-908 )
    ( obj-at p700 l000-315 )
    ( obj-at p710 l000-279 )
    ( obj-at p726 l000-53 )
  )
  ( :tasks
    ( Deliver-13Pkg p815 p748 p556 p498 p315 p57 p267 p855 p417 p835 p700 p710 p726 l000-000 )
  )
)
