( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-53 - location
    l000-29 - location
    l000-805 - location
    l000-7 - location
    l000-720 - location
    l000-34 - location
    l000-378 - location
    l000-909 - location
    l000-960 - location
    l000-151 - location
    l000-524 - location
    l000-16 - location
    l000-87 - location
    p173 - obj
    p518 - obj
    p467 - obj
    p696 - obj
    p76 - obj
    p304 - obj
    p985 - obj
    p776 - obj
    p297 - obj
    p644 - obj
    p78 - obj
    p771 - obj
    p20 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-53 c000 )
    ( in-city l000-29 c000 )
    ( in-city l000-805 c000 )
    ( in-city l000-7 c000 )
    ( in-city l000-720 c000 )
    ( in-city l000-34 c000 )
    ( in-city l000-378 c000 )
    ( in-city l000-909 c000 )
    ( in-city l000-960 c000 )
    ( in-city l000-151 c000 )
    ( in-city l000-524 c000 )
    ( in-city l000-16 c000 )
    ( in-city l000-87 c000 )
    ( obj-at p173 l000-151 )
    ( obj-at p518 l000-34 )
    ( obj-at p467 l000-7 )
    ( obj-at p696 l000-53 )
    ( obj-at p76 l000-34 )
    ( obj-at p304 l000-909 )
    ( obj-at p985 l000-805 )
    ( obj-at p776 l000-720 )
    ( obj-at p297 l000-960 )
    ( obj-at p644 l000-29 )
    ( obj-at p78 l000-34 )
    ( obj-at p771 l000-909 )
    ( obj-at p20 l000-720 )
  )
  ( :goal
    ( and
      ( obj-at p173 l000-000 )
      ( obj-at p518 l000-000 )
      ( obj-at p467 l000-000 )
      ( obj-at p696 l000-000 )
      ( obj-at p76 l000-000 )
      ( obj-at p304 l000-000 )
      ( obj-at p985 l000-000 )
      ( obj-at p776 l000-000 )
      ( obj-at p297 l000-000 )
      ( obj-at p644 l000-000 )
      ( obj-at p78 l000-000 )
      ( obj-at p771 l000-000 )
      ( obj-at p20 l000-000 )
    )
  )
)
