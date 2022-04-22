( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-921 - location
    l000-167 - location
    l000-353 - location
    l000-733 - location
    l000-852 - location
    l000-230 - location
    l000-717 - location
    l000-271 - location
    l000-129 - location
    l000-390 - location
    p200 - obj
    p425 - obj
    p465 - obj
    p682 - obj
    p345 - obj
    p985 - obj
    p786 - obj
    p293 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-921 c000 )
    ( in-city l000-167 c000 )
    ( in-city l000-353 c000 )
    ( in-city l000-733 c000 )
    ( in-city l000-852 c000 )
    ( in-city l000-230 c000 )
    ( in-city l000-717 c000 )
    ( in-city l000-271 c000 )
    ( in-city l000-129 c000 )
    ( in-city l000-390 c000 )
    ( obj-at p200 l000-717 )
    ( obj-at p425 l000-717 )
    ( obj-at p465 l000-230 )
    ( obj-at p682 l000-390 )
    ( obj-at p345 l000-733 )
    ( obj-at p985 l000-717 )
    ( obj-at p786 l000-129 )
    ( obj-at p293 l000-129 )
  )
  ( :tasks
    ( Deliver-8Pkg p200 p425 p465 p682 p345 p985 p786 p293 l000-000 )
  )
)
