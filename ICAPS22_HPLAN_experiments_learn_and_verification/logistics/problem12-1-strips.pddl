( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-672 - location
    l000-880 - location
    l000-930 - location
    l000-797 - location
    l000-594 - location
    l000-200 - location
    l000-122 - location
    l000-316 - location
    l000-201 - location
    l000-32 - location
    l000-263 - location
    l000-205 - location
    l000-152 - location
    l000-681 - location
    l000-78 - location
    l000-842 - location
    l000-484 - location
    l000-784 - location
    l000-157 - location
    p459 - obj
    p685 - obj
    p449 - obj
    p743 - obj
    p919 - obj
    p629 - obj
    p690 - obj
    p932 - obj
    p112 - obj
    p742 - obj
    p771 - obj
    p935 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-672 c000 )
    ( in-city l000-880 c000 )
    ( in-city l000-930 c000 )
    ( in-city l000-797 c000 )
    ( in-city l000-594 c000 )
    ( in-city l000-200 c000 )
    ( in-city l000-122 c000 )
    ( in-city l000-316 c000 )
    ( in-city l000-201 c000 )
    ( in-city l000-32 c000 )
    ( in-city l000-263 c000 )
    ( in-city l000-205 c000 )
    ( in-city l000-152 c000 )
    ( in-city l000-681 c000 )
    ( in-city l000-78 c000 )
    ( in-city l000-842 c000 )
    ( in-city l000-484 c000 )
    ( in-city l000-784 c000 )
    ( in-city l000-157 c000 )
    ( obj-at p459 l000-32 )
    ( obj-at p685 l000-122 )
    ( obj-at p449 l000-797 )
    ( obj-at p743 l000-784 )
    ( obj-at p919 l000-122 )
    ( obj-at p629 l000-880 )
    ( obj-at p690 l000-152 )
    ( obj-at p932 l000-205 )
    ( obj-at p112 l000-263 )
    ( obj-at p742 l000-784 )
    ( obj-at p771 l000-316 )
    ( obj-at p935 l000-842 )
  )
  ( :goal
    ( and
      ( obj-at p459 l000-000 )
      ( obj-at p685 l000-000 )
      ( obj-at p449 l000-000 )
      ( obj-at p743 l000-000 )
      ( obj-at p919 l000-000 )
      ( obj-at p629 l000-000 )
      ( obj-at p690 l000-000 )
      ( obj-at p932 l000-000 )
      ( obj-at p112 l000-000 )
      ( obj-at p742 l000-000 )
      ( obj-at p771 l000-000 )
      ( obj-at p935 l000-000 )
    )
  )
)
