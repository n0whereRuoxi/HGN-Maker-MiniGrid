( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-359 - location
    l000-817 - location
    l000-157 - location
    l000-798 - location
    l000-715 - location
    l000-592 - location
    l000-237 - location
    l000-595 - location
    l000-137 - location
    l000-372 - location
    l000-162 - location
    l000-398 - location
    l000-866 - location
    l000-873 - location
    l000-406 - location
    l000-628 - location
    l000-809 - location
    l000-766 - location
    l000-165 - location
    l000-369 - location
    l000-751 - location
    l000-923 - location
    l000-10 - location
    l000-53 - location
    p603 - obj
    p35 - obj
    p462 - obj
    p999 - obj
    p481 - obj
    p254 - obj
    p621 - obj
    p859 - obj
    p556 - obj
    p708 - obj
    p393 - obj
    p934 - obj
    p132 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-359 c000 )
    ( in-city l000-817 c000 )
    ( in-city l000-157 c000 )
    ( in-city l000-798 c000 )
    ( in-city l000-715 c000 )
    ( in-city l000-592 c000 )
    ( in-city l000-237 c000 )
    ( in-city l000-595 c000 )
    ( in-city l000-137 c000 )
    ( in-city l000-372 c000 )
    ( in-city l000-162 c000 )
    ( in-city l000-398 c000 )
    ( in-city l000-866 c000 )
    ( in-city l000-873 c000 )
    ( in-city l000-406 c000 )
    ( in-city l000-628 c000 )
    ( in-city l000-809 c000 )
    ( in-city l000-766 c000 )
    ( in-city l000-165 c000 )
    ( in-city l000-369 c000 )
    ( in-city l000-751 c000 )
    ( in-city l000-923 c000 )
    ( in-city l000-10 c000 )
    ( in-city l000-53 c000 )
    ( obj-at p603 l000-398 )
    ( obj-at p35 l000-162 )
    ( obj-at p462 l000-817 )
    ( obj-at p999 l000-157 )
    ( obj-at p481 l000-10 )
    ( obj-at p254 l000-406 )
    ( obj-at p621 l000-715 )
    ( obj-at p859 l000-809 )
    ( obj-at p556 l000-798 )
    ( obj-at p708 l000-715 )
    ( obj-at p393 l000-369 )
    ( obj-at p934 l000-359 )
    ( obj-at p132 l000-866 )
  )
  ( :goal
    ( and
      ( obj-at p603 l000-000 )
      ( obj-at p35 l000-000 )
      ( obj-at p462 l000-000 )
      ( obj-at p999 l000-000 )
      ( obj-at p481 l000-000 )
      ( obj-at p254 l000-000 )
      ( obj-at p621 l000-000 )
      ( obj-at p859 l000-000 )
      ( obj-at p556 l000-000 )
      ( obj-at p708 l000-000 )
      ( obj-at p393 l000-000 )
      ( obj-at p934 l000-000 )
      ( obj-at p132 l000-000 )
    )
  )
)
