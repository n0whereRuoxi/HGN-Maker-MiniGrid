( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-605 - location
    l000-923 - location
    l000-787 - location
    l000-786 - location
    l000-34 - location
    l000-958 - location
    l000-607 - location
    l000-374 - location
    l000-826 - location
    l000-982 - location
    l000-929 - location
    l000-406 - location
    l000-813 - location
    l000-967 - location
    l000-347 - location
    l000-590 - location
    l000-321 - location
    l000-165 - location
    l000-157 - location
    l000-197 - location
    l000-842 - location
    p921 - obj
    p231 - obj
    p75 - obj
    p973 - obj
    p451 - obj
    p232 - obj
    p229 - obj
    p115 - obj
    p618 - obj
    p408 - obj
    p384 - obj
    p457 - obj
    p873 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-605 c000 )
    ( in-city l000-923 c000 )
    ( in-city l000-787 c000 )
    ( in-city l000-786 c000 )
    ( in-city l000-34 c000 )
    ( in-city l000-958 c000 )
    ( in-city l000-607 c000 )
    ( in-city l000-374 c000 )
    ( in-city l000-826 c000 )
    ( in-city l000-982 c000 )
    ( in-city l000-929 c000 )
    ( in-city l000-406 c000 )
    ( in-city l000-813 c000 )
    ( in-city l000-967 c000 )
    ( in-city l000-347 c000 )
    ( in-city l000-590 c000 )
    ( in-city l000-321 c000 )
    ( in-city l000-165 c000 )
    ( in-city l000-157 c000 )
    ( in-city l000-197 c000 )
    ( in-city l000-842 c000 )
    ( obj-at p921 l000-590 )
    ( obj-at p231 l000-923 )
    ( obj-at p75 l000-157 )
    ( obj-at p973 l000-321 )
    ( obj-at p451 l000-787 )
    ( obj-at p232 l000-605 )
    ( obj-at p229 l000-923 )
    ( obj-at p115 l000-929 )
    ( obj-at p618 l000-321 )
    ( obj-at p408 l000-958 )
    ( obj-at p384 l000-813 )
    ( obj-at p457 l000-982 )
    ( obj-at p873 l000-982 )
  )
  ( :tasks
    ( Deliver-13Pkg p921 p231 p75 p973 p451 p232 p229 p115 p618 p408 p384 p457 p873 l000-000 )
  )
)
