( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-743 - location
    l000-915 - location
    l000-928 - location
    l000-221 - location
    l000-902 - location
    l000-461 - location
    l000-909 - location
    l000-345 - location
    l000-788 - location
    l000-695 - location
    p634 - obj
    p463 - obj
    p918 - obj
    p528 - obj
    p60 - obj
    p466 - obj
    p981 - obj
    p705 - obj
    p477 - obj
    p988 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-743 c000 )
    ( in-city l000-915 c000 )
    ( in-city l000-928 c000 )
    ( in-city l000-221 c000 )
    ( in-city l000-902 c000 )
    ( in-city l000-461 c000 )
    ( in-city l000-909 c000 )
    ( in-city l000-345 c000 )
    ( in-city l000-788 c000 )
    ( in-city l000-695 c000 )
    ( obj-at p634 l000-743 )
    ( obj-at p463 l000-928 )
    ( obj-at p918 l000-221 )
    ( obj-at p528 l000-461 )
    ( obj-at p60 l000-902 )
    ( obj-at p466 l000-909 )
    ( obj-at p981 l000-221 )
    ( obj-at p705 l000-695 )
    ( obj-at p477 l000-909 )
    ( obj-at p988 l000-743 )
  )
  ( :goal
    ( and
      ( obj-at p634 l000-000 )
      ( obj-at p463 l000-000 )
      ( obj-at p918 l000-000 )
      ( obj-at p528 l000-000 )
      ( obj-at p60 l000-000 )
      ( obj-at p466 l000-000 )
      ( obj-at p981 l000-000 )
      ( obj-at p705 l000-000 )
      ( obj-at p477 l000-000 )
      ( obj-at p988 l000-000 )
    )
  )
)
