( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b403 - block
    b769 - block
    b2 - block
    b533 - block
    b206 - block
    b374 - block
    b864 - block
    b525 - block
    b824 - block
    b867 - block
    b707 - block
    b743 - block
    b62 - block
    b325 - block
    b907 - block
    b409 - block
    b407 - block
    b855 - block
    b912 - block
    b27 - block
    b611 - block
    b557 - block
    b306 - block
    b351 - block
    b687 - block
    b205 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b403 )
    ( on b769 b403 )
    ( on b2 b769 )
    ( on b533 b2 )
    ( on b206 b533 )
    ( on b374 b206 )
    ( on b864 b374 )
    ( on b525 b864 )
    ( on b824 b525 )
    ( on b867 b824 )
    ( on b707 b867 )
    ( on b743 b707 )
    ( on b62 b743 )
    ( on b325 b62 )
    ( on b907 b325 )
    ( on b409 b907 )
    ( on b407 b409 )
    ( on b855 b407 )
    ( on b912 b855 )
    ( on b27 b912 )
    ( on b611 b27 )
    ( on b557 b611 )
    ( on b306 b557 )
    ( on b351 b306 )
    ( on b687 b351 )
    ( on b205 b687 )
    ( clear b205 )
  )
  ( :goal
    ( and
      ( clear b403 )
    )
  )
)
