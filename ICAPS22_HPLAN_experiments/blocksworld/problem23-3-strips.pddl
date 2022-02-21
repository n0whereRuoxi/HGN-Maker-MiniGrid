( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b132 - block
    b143 - block
    b596 - block
    b670 - block
    b637 - block
    b15 - block
    b11 - block
    b764 - block
    b630 - block
    b804 - block
    b601 - block
    b436 - block
    b940 - block
    b952 - block
    b929 - block
    b954 - block
    b856 - block
    b275 - block
    b968 - block
    b625 - block
    b568 - block
    b814 - block
    b751 - block
    b624 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b132 )
    ( on b143 b132 )
    ( on b596 b143 )
    ( on b670 b596 )
    ( on b637 b670 )
    ( on b15 b637 )
    ( on b11 b15 )
    ( on b764 b11 )
    ( on b630 b764 )
    ( on b804 b630 )
    ( on b601 b804 )
    ( on b436 b601 )
    ( on b940 b436 )
    ( on b952 b940 )
    ( on b929 b952 )
    ( on b954 b929 )
    ( on b856 b954 )
    ( on b275 b856 )
    ( on b968 b275 )
    ( on b625 b968 )
    ( on b568 b625 )
    ( on b814 b568 )
    ( on b751 b814 )
    ( on b624 b751 )
    ( clear b624 )
  )
  ( :goal
    ( and
      ( clear b132 )
    )
  )
)
