( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-482 - location
    l000-843 - location
    l000-875 - location
    l000-847 - location
    l000-323 - location
    l000-397 - location
    l000-378 - location
    l000-216 - location
    l000-198 - location
    p333 - obj
    p960 - obj
    p471 - obj
    p223 - obj
    p148 - obj
    p616 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-482 c000 )
    ( in-city l000-843 c000 )
    ( in-city l000-875 c000 )
    ( in-city l000-847 c000 )
    ( in-city l000-323 c000 )
    ( in-city l000-397 c000 )
    ( in-city l000-378 c000 )
    ( in-city l000-216 c000 )
    ( in-city l000-198 c000 )
    ( obj-at p333 l000-198 )
    ( obj-at p960 l000-323 )
    ( obj-at p471 l000-216 )
    ( obj-at p223 l000-482 )
    ( obj-at p148 l000-323 )
    ( obj-at p616 l000-323 )
  )
  ( :tasks
    ( Deliver-6Pkg p333 p960 p471 p223 p148 p616 l000-000 )
  )
)
