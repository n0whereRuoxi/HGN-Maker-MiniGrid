( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-796 - location
    l000-746 - location
    l000-130 - location
    l000-944 - location
    l000-997 - location
    l000-255 - location
    p429 - obj
    p692 - obj
    p693 - obj
    p806 - obj
    p909 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-796 c000 )
    ( in-city l000-746 c000 )
    ( in-city l000-130 c000 )
    ( in-city l000-944 c000 )
    ( in-city l000-997 c000 )
    ( in-city l000-255 c000 )
    ( obj-at p429 l000-944 )
    ( obj-at p692 l000-944 )
    ( obj-at p693 l000-796 )
    ( obj-at p806 l000-130 )
    ( obj-at p909 l000-130 )
  )
  ( :tasks
    ( Deliver-5Pkg p429 p692 p693 p806 p909 l000-000 )
  )
)
