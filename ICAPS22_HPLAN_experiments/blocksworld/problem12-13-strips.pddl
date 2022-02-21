( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b912 - block
    b600 - block
    b863 - block
    b563 - block
    b48 - block
    b656 - block
    b495 - block
    b244 - block
    b817 - block
    b406 - block
    b53 - block
    b83 - block
    b919 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b912 )
    ( on b600 b912 )
    ( on b863 b600 )
    ( on b563 b863 )
    ( on b48 b563 )
    ( on b656 b48 )
    ( on b495 b656 )
    ( on b244 b495 )
    ( on b817 b244 )
    ( on b406 b817 )
    ( on b53 b406 )
    ( on b83 b53 )
    ( on b919 b83 )
    ( clear b919 )
  )
  ( :goal
    ( and
      ( clear b912 )
    )
  )
)
