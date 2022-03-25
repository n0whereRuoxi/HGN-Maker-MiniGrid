( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-793 - location
    l000-354 - location
    l000-925 - location
    l000-968 - location
    l000-774 - location
    l000-305 - location
    l000-538 - location
    l000-397 - location
    l000-159 - location
    l000-831 - location
    l000-814 - location
    l000-553 - location
    l000-761 - location
    l000-346 - location
    l000-908 - location
    l000-914 - location
    l000-53 - location
    l000-257 - location
    l000-331 - location
    l000-163 - location
    l000-805 - location
    l000-852 - location
    l000-87 - location
    l000-444 - location
    l000-175 - location
    p446 - obj
    p554 - obj
    p201 - obj
    p320 - obj
    p92 - obj
    p967 - obj
    p816 - obj
    p4 - obj
    p471 - obj
    p103 - obj
    p861 - obj
    p437 - obj
    p135 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-793 c000 )
    ( in-city l000-354 c000 )
    ( in-city l000-925 c000 )
    ( in-city l000-968 c000 )
    ( in-city l000-774 c000 )
    ( in-city l000-305 c000 )
    ( in-city l000-538 c000 )
    ( in-city l000-397 c000 )
    ( in-city l000-159 c000 )
    ( in-city l000-831 c000 )
    ( in-city l000-814 c000 )
    ( in-city l000-553 c000 )
    ( in-city l000-761 c000 )
    ( in-city l000-346 c000 )
    ( in-city l000-908 c000 )
    ( in-city l000-914 c000 )
    ( in-city l000-53 c000 )
    ( in-city l000-257 c000 )
    ( in-city l000-331 c000 )
    ( in-city l000-163 c000 )
    ( in-city l000-805 c000 )
    ( in-city l000-852 c000 )
    ( in-city l000-87 c000 )
    ( in-city l000-444 c000 )
    ( in-city l000-175 c000 )
    ( obj-at p446 l000-805 )
    ( obj-at p554 l000-908 )
    ( obj-at p201 l000-761 )
    ( obj-at p320 l000-761 )
    ( obj-at p92 l000-257 )
    ( obj-at p967 l000-175 )
    ( obj-at p816 l000-163 )
    ( obj-at p4 l000-331 )
    ( obj-at p471 l000-793 )
    ( obj-at p103 l000-831 )
    ( obj-at p861 l000-908 )
    ( obj-at p437 l000-331 )
    ( obj-at p135 l000-538 )
  )
  ( :tasks
    ( Deliver-13Pkg p446 p554 p201 p320 p92 p967 p816 p4 p471 p103 p861 p437 p135 l000-000 )
  )
)
