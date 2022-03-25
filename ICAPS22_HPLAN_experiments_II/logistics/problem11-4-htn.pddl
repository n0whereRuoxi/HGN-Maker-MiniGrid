( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-384 - location
    l000-142 - location
    l000-103 - location
    l000-559 - location
    l000-540 - location
    l000-40 - location
    l000-570 - location
    l000-888 - location
    l000-160 - location
    p44 - obj
    p321 - obj
    p523 - obj
    p929 - obj
    p723 - obj
    p821 - obj
    p319 - obj
    p528 - obj
    p749 - obj
    p711 - obj
    p187 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-384 c000 )
    ( in-city l000-142 c000 )
    ( in-city l000-103 c000 )
    ( in-city l000-559 c000 )
    ( in-city l000-540 c000 )
    ( in-city l000-40 c000 )
    ( in-city l000-570 c000 )
    ( in-city l000-888 c000 )
    ( in-city l000-160 c000 )
    ( obj-at p44 l000-160 )
    ( obj-at p321 l000-103 )
    ( obj-at p523 l000-570 )
    ( obj-at p929 l000-40 )
    ( obj-at p723 l000-888 )
    ( obj-at p821 l000-540 )
    ( obj-at p319 l000-540 )
    ( obj-at p528 l000-142 )
    ( obj-at p749 l000-888 )
    ( obj-at p711 l000-142 )
    ( obj-at p187 l000-570 )
  )
  ( :tasks
    ( Deliver-11Pkg p44 p321 p523 p929 p723 p821 p319 p528 p749 p711 p187 l000-000 )
  )
)
