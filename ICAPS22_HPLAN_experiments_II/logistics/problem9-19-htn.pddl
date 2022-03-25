( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-125 - location
    l000-554 - location
    l000-59 - location
    l000-5 - location
    l000-470 - location
    l000-947 - location
    l000-181 - location
    p865 - obj
    p57 - obj
    p531 - obj
    p122 - obj
    p926 - obj
    p54 - obj
    p173 - obj
    p762 - obj
    p199 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-125 c000 )
    ( in-city l000-554 c000 )
    ( in-city l000-59 c000 )
    ( in-city l000-5 c000 )
    ( in-city l000-470 c000 )
    ( in-city l000-947 c000 )
    ( in-city l000-181 c000 )
    ( obj-at p865 l000-554 )
    ( obj-at p57 l000-470 )
    ( obj-at p531 l000-554 )
    ( obj-at p122 l000-59 )
    ( obj-at p926 l000-5 )
    ( obj-at p54 l000-125 )
    ( obj-at p173 l000-554 )
    ( obj-at p762 l000-125 )
    ( obj-at p199 l000-59 )
  )
  ( :tasks
    ( Deliver-9Pkg p865 p57 p531 p122 p926 p54 p173 p762 p199 l000-000 )
  )
)
