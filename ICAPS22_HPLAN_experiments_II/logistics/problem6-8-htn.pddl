( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-505 - location
    l000-719 - location
    l000-830 - location
    l000-393 - location
    p696 - obj
    p678 - obj
    p724 - obj
    p293 - obj
    p979 - obj
    p133 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-505 c000 )
    ( in-city l000-719 c000 )
    ( in-city l000-830 c000 )
    ( in-city l000-393 c000 )
    ( obj-at p696 l000-830 )
    ( obj-at p678 l000-393 )
    ( obj-at p724 l000-393 )
    ( obj-at p293 l000-505 )
    ( obj-at p979 l000-830 )
    ( obj-at p133 l000-719 )
  )
  ( :tasks
    ( Deliver-6Pkg p696 p678 p724 p293 p979 p133 l000-000 )
  )
)
