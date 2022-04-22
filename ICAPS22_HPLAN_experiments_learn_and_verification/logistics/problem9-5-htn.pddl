( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-43 - location
    l000-632 - location
    l000-165 - location
    l000-374 - location
    l000-857 - location
    l000-515 - location
    l000-709 - location
    l000-803 - location
    l000-810 - location
    l000-28 - location
    l000-443 - location
    l000-304 - location
    l000-994 - location
    l000-157 - location
    l000-53 - location
    p44 - obj
    p553 - obj
    p606 - obj
    p879 - obj
    p121 - obj
    p687 - obj
    p403 - obj
    p360 - obj
    p737 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-43 c000 )
    ( in-city l000-632 c000 )
    ( in-city l000-165 c000 )
    ( in-city l000-374 c000 )
    ( in-city l000-857 c000 )
    ( in-city l000-515 c000 )
    ( in-city l000-709 c000 )
    ( in-city l000-803 c000 )
    ( in-city l000-810 c000 )
    ( in-city l000-28 c000 )
    ( in-city l000-443 c000 )
    ( in-city l000-304 c000 )
    ( in-city l000-994 c000 )
    ( in-city l000-157 c000 )
    ( in-city l000-53 c000 )
    ( obj-at p44 l000-165 )
    ( obj-at p553 l000-43 )
    ( obj-at p606 l000-28 )
    ( obj-at p879 l000-632 )
    ( obj-at p121 l000-632 )
    ( obj-at p687 l000-43 )
    ( obj-at p403 l000-43 )
    ( obj-at p360 l000-443 )
    ( obj-at p737 l000-857 )
  )
  ( :tasks
    ( Deliver-9Pkg p44 p553 p606 p879 p121 p687 p403 p360 p737 l000-000 )
  )
)
