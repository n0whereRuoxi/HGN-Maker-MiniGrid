( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-101 - location
    l000-185 - location
    l000-273 - location
    l000-546 - location
    l000-735 - location
    l000-681 - location
    l000-235 - location
    l000-123 - location
    l000-58 - location
    l000-624 - location
    l000-178 - location
    l000-132 - location
    l000-874 - location
    l000-152 - location
    l000-881 - location
    l000-304 - location
    l000-725 - location
    l000-999 - location
    l000-623 - location
    l000-140 - location
    p651 - obj
    p352 - obj
    p510 - obj
    p384 - obj
    p121 - obj
    p360 - obj
    p254 - obj
    p357 - obj
    p40 - obj
    p37 - obj
    p104 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-101 c000 )
    ( in-city l000-185 c000 )
    ( in-city l000-273 c000 )
    ( in-city l000-546 c000 )
    ( in-city l000-735 c000 )
    ( in-city l000-681 c000 )
    ( in-city l000-235 c000 )
    ( in-city l000-123 c000 )
    ( in-city l000-58 c000 )
    ( in-city l000-624 c000 )
    ( in-city l000-178 c000 )
    ( in-city l000-132 c000 )
    ( in-city l000-874 c000 )
    ( in-city l000-152 c000 )
    ( in-city l000-881 c000 )
    ( in-city l000-304 c000 )
    ( in-city l000-725 c000 )
    ( in-city l000-999 c000 )
    ( in-city l000-623 c000 )
    ( in-city l000-140 c000 )
    ( obj-at p651 l000-140 )
    ( obj-at p352 l000-681 )
    ( obj-at p510 l000-185 )
    ( obj-at p384 l000-624 )
    ( obj-at p121 l000-881 )
    ( obj-at p360 l000-735 )
    ( obj-at p254 l000-185 )
    ( obj-at p357 l000-304 )
    ( obj-at p40 l000-681 )
    ( obj-at p37 l000-101 )
    ( obj-at p104 l000-58 )
  )
  ( :tasks
    ( Deliver-11Pkg p651 p352 p510 p384 p121 p360 p254 p357 p40 p37 p104 l000-000 )
  )
)
