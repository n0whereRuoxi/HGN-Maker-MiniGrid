( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-157 - location
    l000-884 - location
    l000-297 - location
    l000-561 - location
    l000-965 - location
    l000-565 - location
    l000-456 - location
    l000-844 - location
    l000-592 - location
    p399 - obj
    p250 - obj
    p228 - obj
    p212 - obj
    p477 - obj
    p9 - obj
    p879 - obj
    p425 - obj
    p134 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-157 c000 )
    ( in-city l000-884 c000 )
    ( in-city l000-297 c000 )
    ( in-city l000-561 c000 )
    ( in-city l000-965 c000 )
    ( in-city l000-565 c000 )
    ( in-city l000-456 c000 )
    ( in-city l000-844 c000 )
    ( in-city l000-592 c000 )
    ( obj-at p399 l000-456 )
    ( obj-at p250 l000-157 )
    ( obj-at p228 l000-884 )
    ( obj-at p212 l000-561 )
    ( obj-at p477 l000-561 )
    ( obj-at p9 l000-844 )
    ( obj-at p879 l000-297 )
    ( obj-at p425 l000-565 )
    ( obj-at p134 l000-884 )
  )
  ( :tasks
    ( Deliver-9Pkg p399 p250 p228 p212 p477 p9 p879 p425 p134 l000-000 )
  )
)
