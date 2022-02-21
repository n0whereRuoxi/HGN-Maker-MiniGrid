( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-133 - location
    l000-703 - location
    l000-880 - location
    l000-420 - location
    l000-527 - location
    l000-638 - location
    l000-130 - location
    l000-643 - location
    p312 - obj
    p642 - obj
    p293 - obj
    p537 - obj
    p890 - obj
    p607 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-133 c000 )
    ( in-city l000-703 c000 )
    ( in-city l000-880 c000 )
    ( in-city l000-420 c000 )
    ( in-city l000-527 c000 )
    ( in-city l000-638 c000 )
    ( in-city l000-130 c000 )
    ( in-city l000-643 c000 )
    ( obj-at p312 l000-643 )
    ( obj-at p642 l000-703 )
    ( obj-at p293 l000-130 )
    ( obj-at p537 l000-703 )
    ( obj-at p890 l000-880 )
    ( obj-at p607 l000-527 )
  )
  ( :goal
    ( and
      ( obj-at p312 l000-000 )
      ( obj-at p642 l000-000 )
      ( obj-at p293 l000-000 )
      ( obj-at p537 l000-000 )
      ( obj-at p890 l000-000 )
      ( obj-at p607 l000-000 )
    )
  )
)
