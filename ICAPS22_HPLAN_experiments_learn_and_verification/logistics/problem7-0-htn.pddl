( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-986 - location
    l000-330 - location
    l000-69 - location
    l000-553 - location
    l000-249 - location
    l000-934 - location
    p244 - obj
    p517 - obj
    p660 - obj
    p608 - obj
    p550 - obj
    p876 - obj
    p865 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-986 c000 )
    ( in-city l000-330 c000 )
    ( in-city l000-69 c000 )
    ( in-city l000-553 c000 )
    ( in-city l000-249 c000 )
    ( in-city l000-934 c000 )
    ( obj-at p244 l000-934 )
    ( obj-at p517 l000-69 )
    ( obj-at p660 l000-69 )
    ( obj-at p608 l000-330 )
    ( obj-at p550 l000-330 )
    ( obj-at p876 l000-934 )
    ( obj-at p865 l000-553 )
  )
  ( :tasks
    ( Deliver-7Pkg p244 p517 p660 p608 p550 p876 p865 l000-000 )
  )
)
