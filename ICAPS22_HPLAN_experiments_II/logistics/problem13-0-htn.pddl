( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-392 - location
    l000-327 - location
    l000-551 - location
    l000-314 - location
    l000-880 - location
    l000-805 - location
    l000-172 - location
    l000-367 - location
    l000-113 - location
    l000-955 - location
    l000-931 - location
    l000-902 - location
    p731 - obj
    p612 - obj
    p897 - obj
    p456 - obj
    p689 - obj
    p26 - obj
    p301 - obj
    p588 - obj
    p35 - obj
    p284 - obj
    p513 - obj
    p94 - obj
    p511 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-392 c000 )
    ( in-city l000-327 c000 )
    ( in-city l000-551 c000 )
    ( in-city l000-314 c000 )
    ( in-city l000-880 c000 )
    ( in-city l000-805 c000 )
    ( in-city l000-172 c000 )
    ( in-city l000-367 c000 )
    ( in-city l000-113 c000 )
    ( in-city l000-955 c000 )
    ( in-city l000-931 c000 )
    ( in-city l000-902 c000 )
    ( obj-at p731 l000-902 )
    ( obj-at p612 l000-327 )
    ( obj-at p897 l000-931 )
    ( obj-at p456 l000-955 )
    ( obj-at p689 l000-931 )
    ( obj-at p26 l000-931 )
    ( obj-at p301 l000-314 )
    ( obj-at p588 l000-902 )
    ( obj-at p35 l000-955 )
    ( obj-at p284 l000-172 )
    ( obj-at p513 l000-880 )
    ( obj-at p94 l000-327 )
    ( obj-at p511 l000-367 )
  )
  ( :tasks
    ( Deliver-13Pkg p731 p612 p897 p456 p689 p26 p301 p588 p35 p284 p513 p94 p511 l000-000 )
  )
)
