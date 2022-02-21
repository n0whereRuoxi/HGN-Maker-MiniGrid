( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b413 - block
    b463 - block
    b765 - block
    b779 - block
    b574 - block
    b512 - block
    b755 - block
    b636 - block
    b631 - block
    b716 - block
    b836 - block
    b472 - block
    b249 - block
    b386 - block
    b286 - block
    b401 - block
    b408 - block
    b556 - block
    b380 - block
    b481 - block
    b562 - block
    b418 - block
    b835 - block
    b433 - block
    b523 - block
    b440 - block
    b700 - block
    b363 - block
    b157 - block
    b965 - block
    b771 - block
    b959 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b413 )
    ( on b463 b413 )
    ( on b765 b463 )
    ( on b779 b765 )
    ( on b574 b779 )
    ( on b512 b574 )
    ( on b755 b512 )
    ( on b636 b755 )
    ( on b631 b636 )
    ( on b716 b631 )
    ( on b836 b716 )
    ( on b472 b836 )
    ( on b249 b472 )
    ( on b386 b249 )
    ( on b286 b386 )
    ( on b401 b286 )
    ( on b408 b401 )
    ( on b556 b408 )
    ( on b380 b556 )
    ( on b481 b380 )
    ( on b562 b481 )
    ( on b418 b562 )
    ( on b835 b418 )
    ( on b433 b835 )
    ( on b523 b433 )
    ( on b440 b523 )
    ( on b700 b440 )
    ( on b363 b700 )
    ( on b157 b363 )
    ( on b965 b157 )
    ( on b771 b965 )
    ( on b959 b771 )
    ( clear b959 )
  )
  ( :goal
    ( and
      ( clear b413 )
    )
  )
)
