( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b292 - block
    b693 - block
    b505 - block
    b762 - block
    b114 - block
    b661 - block
    b249 - block
    b653 - block
    b600 - block
    b540 - block
    b746 - block
    b804 - block
    b175 - block
    b630 - block
    b212 - block
    b927 - block
    b773 - block
    b802 - block
    b405 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b292 )
    ( on b693 b292 )
    ( on b505 b693 )
    ( on b762 b505 )
    ( on b114 b762 )
    ( on b661 b114 )
    ( on b249 b661 )
    ( on b653 b249 )
    ( on b600 b653 )
    ( on b540 b600 )
    ( on b746 b540 )
    ( on b804 b746 )
    ( on b175 b804 )
    ( on b630 b175 )
    ( on b212 b630 )
    ( on b927 b212 )
    ( on b773 b927 )
    ( on b802 b773 )
    ( on b405 b802 )
    ( clear b405 )
  )
  ( :goal
    ( and
      ( clear b292 )
    )
  )
)
