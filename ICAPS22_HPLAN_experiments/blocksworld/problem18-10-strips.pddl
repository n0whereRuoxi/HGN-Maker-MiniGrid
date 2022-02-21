( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b414 - block
    b403 - block
    b574 - block
    b44 - block
    b15 - block
    b248 - block
    b257 - block
    b914 - block
    b610 - block
    b483 - block
    b747 - block
    b751 - block
    b11 - block
    b919 - block
    b124 - block
    b470 - block
    b648 - block
    b473 - block
    b687 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b414 )
    ( on b403 b414 )
    ( on b574 b403 )
    ( on b44 b574 )
    ( on b15 b44 )
    ( on b248 b15 )
    ( on b257 b248 )
    ( on b914 b257 )
    ( on b610 b914 )
    ( on b483 b610 )
    ( on b747 b483 )
    ( on b751 b747 )
    ( on b11 b751 )
    ( on b919 b11 )
    ( on b124 b919 )
    ( on b470 b124 )
    ( on b648 b470 )
    ( on b473 b648 )
    ( on b687 b473 )
    ( clear b687 )
  )
  ( :goal
    ( and
      ( clear b414 )
    )
  )
)
