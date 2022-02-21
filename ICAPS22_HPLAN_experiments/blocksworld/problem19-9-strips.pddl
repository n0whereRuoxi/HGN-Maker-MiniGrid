( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b474 - block
    b804 - block
    b833 - block
    b68 - block
    b520 - block
    b612 - block
    b359 - block
    b94 - block
    b715 - block
    b293 - block
    b693 - block
    b775 - block
    b774 - block
    b145 - block
    b262 - block
    b751 - block
    b950 - block
    b894 - block
    b601 - block
    b135 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b474 )
    ( on b804 b474 )
    ( on b833 b804 )
    ( on b68 b833 )
    ( on b520 b68 )
    ( on b612 b520 )
    ( on b359 b612 )
    ( on b94 b359 )
    ( on b715 b94 )
    ( on b293 b715 )
    ( on b693 b293 )
    ( on b775 b693 )
    ( on b774 b775 )
    ( on b145 b774 )
    ( on b262 b145 )
    ( on b751 b262 )
    ( on b950 b751 )
    ( on b894 b950 )
    ( on b601 b894 )
    ( on b135 b601 )
    ( clear b135 )
  )
  ( :goal
    ( and
      ( clear b474 )
    )
  )
)
