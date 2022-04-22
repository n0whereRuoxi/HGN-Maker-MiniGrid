( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-413 - location
    l000-389 - location
    l000-714 - location
    l000-393 - location
    l000-582 - location
    l000-675 - location
    l000-585 - location
    l000-965 - location
    l000-636 - location
    p745 - obj
    p613 - obj
    p322 - obj
    p949 - obj
    p775 - obj
    p537 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-413 c000 )
    ( in-city l000-389 c000 )
    ( in-city l000-714 c000 )
    ( in-city l000-393 c000 )
    ( in-city l000-582 c000 )
    ( in-city l000-675 c000 )
    ( in-city l000-585 c000 )
    ( in-city l000-965 c000 )
    ( in-city l000-636 c000 )
    ( obj-at p745 l000-636 )
    ( obj-at p613 l000-965 )
    ( obj-at p322 l000-393 )
    ( obj-at p949 l000-585 )
    ( obj-at p775 l000-585 )
    ( obj-at p537 l000-965 )
  )
  ( :tasks
    ( Deliver-6Pkg p745 p613 p322 p949 p775 p537 l000-000 )
  )
)
