( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-547 - location
    l000-152 - location
    l000-586 - location
    l000-939 - location
    l000-784 - location
    l000-146 - location
    l000-731 - location
    l000-226 - location
    l000-793 - location
    l000-288 - location
    l000-943 - location
    l000-883 - location
    l000-390 - location
    l000-763 - location
    l000-631 - location
    l000-929 - location
    l000-688 - location
    l000-598 - location
    l000-962 - location
    l000-264 - location
    l000-191 - location
    l000-159 - location
    p518 - obj
    p783 - obj
    p792 - obj
    p837 - obj
    p762 - obj
    p434 - obj
    p819 - obj
    p238 - obj
    p539 - obj
    p570 - obj
    p681 - obj
    p581 - obj
    p700 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-547 c000 )
    ( in-city l000-152 c000 )
    ( in-city l000-586 c000 )
    ( in-city l000-939 c000 )
    ( in-city l000-784 c000 )
    ( in-city l000-146 c000 )
    ( in-city l000-731 c000 )
    ( in-city l000-226 c000 )
    ( in-city l000-793 c000 )
    ( in-city l000-288 c000 )
    ( in-city l000-943 c000 )
    ( in-city l000-883 c000 )
    ( in-city l000-390 c000 )
    ( in-city l000-763 c000 )
    ( in-city l000-631 c000 )
    ( in-city l000-929 c000 )
    ( in-city l000-688 c000 )
    ( in-city l000-598 c000 )
    ( in-city l000-962 c000 )
    ( in-city l000-264 c000 )
    ( in-city l000-191 c000 )
    ( in-city l000-159 c000 )
    ( obj-at p518 l000-731 )
    ( obj-at p783 l000-152 )
    ( obj-at p792 l000-763 )
    ( obj-at p837 l000-146 )
    ( obj-at p762 l000-146 )
    ( obj-at p434 l000-939 )
    ( obj-at p819 l000-943 )
    ( obj-at p238 l000-731 )
    ( obj-at p539 l000-784 )
    ( obj-at p570 l000-962 )
    ( obj-at p681 l000-547 )
    ( obj-at p581 l000-688 )
    ( obj-at p700 l000-226 )
  )
  ( :goal
    ( and
      ( obj-at p518 l000-000 )
      ( obj-at p783 l000-000 )
      ( obj-at p792 l000-000 )
      ( obj-at p837 l000-000 )
      ( obj-at p762 l000-000 )
      ( obj-at p434 l000-000 )
      ( obj-at p819 l000-000 )
      ( obj-at p238 l000-000 )
      ( obj-at p539 l000-000 )
      ( obj-at p570 l000-000 )
      ( obj-at p681 l000-000 )
      ( obj-at p581 l000-000 )
      ( obj-at p700 l000-000 )
    )
  )
)
