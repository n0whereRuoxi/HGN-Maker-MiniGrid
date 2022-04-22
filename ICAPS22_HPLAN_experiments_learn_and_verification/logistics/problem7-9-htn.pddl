( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-87 - location
    l000-321 - location
    l000-675 - location
    l000-249 - location
    l000-448 - location
    l000-411 - location
    l000-897 - location
    p981 - obj
    p749 - obj
    p181 - obj
    p397 - obj
    p303 - obj
    p10 - obj
    p286 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-87 c000 )
    ( in-city l000-321 c000 )
    ( in-city l000-675 c000 )
    ( in-city l000-249 c000 )
    ( in-city l000-448 c000 )
    ( in-city l000-411 c000 )
    ( in-city l000-897 c000 )
    ( obj-at p981 l000-675 )
    ( obj-at p749 l000-897 )
    ( obj-at p181 l000-448 )
    ( obj-at p397 l000-675 )
    ( obj-at p303 l000-87 )
    ( obj-at p10 l000-87 )
    ( obj-at p286 l000-897 )
  )
  ( :tasks
    ( Deliver-7Pkg p981 p749 p181 p397 p303 p10 p286 l000-000 )
  )
)
