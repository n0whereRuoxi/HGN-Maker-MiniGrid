( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-199 - location
    l000-872 - location
    l000-754 - location
    p476 - obj
    p537 - obj
    p603 - obj
    p154 - obj
    p456 - obj
    p45 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-199 c000 )
    ( in-city l000-872 c000 )
    ( in-city l000-754 c000 )
    ( obj-at p476 l000-754 )
    ( obj-at p537 l000-199 )
    ( obj-at p603 l000-872 )
    ( obj-at p154 l000-872 )
    ( obj-at p456 l000-872 )
    ( obj-at p45 l000-199 )
  )
  ( :goal
    ( and
      ( obj-at p476 l000-000 )
      ( obj-at p537 l000-000 )
      ( obj-at p603 l000-000 )
      ( obj-at p154 l000-000 )
      ( obj-at p456 l000-000 )
      ( obj-at p45 l000-000 )
    )
  )
)
